body = { "email" => "my@email.com", "password" => "password1" }
json._errors @api_user.errors.full_messages unless @api_user.errors.empty?
json._links do
  json.POST api_user_registration_url
  json.body body
end
