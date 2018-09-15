json._links do
  json.self api_v1_school_url(school)
end
json.name school.name
json.created_at school.created_at
json.updated_at school.updated_at
