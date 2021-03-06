class User
  include Mongoid::Document
  include Mongoid::Paperclip
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_mongoid_attached_file :image,
              :styles => { :thumb  => "50x50#",
                           :small  => "150x150>",
                           :medium => "300x200>",
                           :large  => "600x600>"   },
               :path => ":rails_root/public/assets/users/:id/:style/:filename",
               :url => "/assets/users/:id/:style/:filename",
               :default_url => "users/default/:style/default.png"
               
  field :biography, type: String 
  field :website, type: String 
  field :facebook, type: String 
  field :twitter, type: String 
  field :time_budget, type: Integer, default: 0

  ## Database authenticatable
  field :name
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :image, :biography, :website, :facebook, :twitter, :time_budget
  
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time
end
