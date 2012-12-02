class Fan
  include Mongoid::Document
  field  :user_id, type: String
  embedded_in :project
end
