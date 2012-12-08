class Project
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :title, type: String
  field :description, type: String
  field :image_url, type: String
  field :likes, type: Integer, default: 0
  embeds_many :fans
  has_and_belongs_to_many :categories
end
