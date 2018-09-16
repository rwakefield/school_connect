json._links do
  json.self api_v1_school_message_url(school, message)
end
json.header message.header
json.body message.body
json.created_at message.created_at
json.updated_at message.updated_at
