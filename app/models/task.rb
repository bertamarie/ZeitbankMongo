class Task
  include Mongoid::Document
  field :title, type: String
  field :description, type: String
  field :status, type: String
  field :owner, type: String
  field :time_value, type: Integer, default: 1
  embedded_in :project
end
