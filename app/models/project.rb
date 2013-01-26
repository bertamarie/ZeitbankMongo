class Project
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps::Created   
  include Tire::Model::Search
  include Tire::Model::Callbacks
  
  #def self.search(params)
   #   tire.search(load: true) do
    #    query { string params[:query], default_operator: "AND" } if params[:query].present?
     # end
#  end
  
  
  has_mongoid_attached_file :image,
              :styles => { :thumb  => "50x50#",
                           :small  => "150x150>",
                           :medium => "300x200>",
                           :large  => "600x600>"   },
               :path => ":rails_root/public/assets/projects/:id/:style/:filename",
               :url => "/assets/projects/:id/:style/:filename",
               :default_url => "projects/default/:style/default.jpg"
  
  field :title, type: String
  field :description, type: String   
  field :city, type: String 
  field :likes, type: Integer, default: 0
  field :time_budget, type: Integer, default: 0
  field :donated_time, type: Integer, default: 0
  field :owner, type: String
  field :supporter, type: Array     
  field :fans, type: Array       
  has_and_belongs_to_many :categories
  embeds_many :tasks
end
