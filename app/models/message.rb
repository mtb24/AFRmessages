class Message
  include Mongoid::Document
  field from type:String
  field time type:Integer
  field message type:String
end