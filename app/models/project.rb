class Project
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :image_url, type: String
  embeds_many :fans
end
