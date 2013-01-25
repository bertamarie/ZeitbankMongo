class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :subject, type: String
  field :content, type: String
  field :recipient, type: String
  field :sender, type: String
end
