json.array!(@messages) do |message|
  json.extract! message, :id, :body, :from
  json.url message_url(message, format: :json)
end
