json.alert flash[:alert] if flash[:alert]
json._links do
  json.signIn api_user_session_url
  json.signUp new_api_user_registration_url
end
