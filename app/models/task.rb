class Task
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :status, type: String
  field :owner, type: String
  embedded_in :project
end
