json._links do
  json.self api_v1_schools_url
end
json.totalCount = @schools.count
json._embedded do
  json.schools @schools do |school|
    json.partial! partial: 'school', locals: { school: school }
  end
end
