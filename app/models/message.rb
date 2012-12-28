class Message
  include Mongoid::Document
  field :subject, type: String
  field :content, type: String
  field :recipient, type: String
  field :sender, type: String
end
