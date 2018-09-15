json._links do
  json.self api_v1_schools_url(page: @paginator.current_page)
  json.prev api_v1_schools_url(page: @paginator.prev_page) if @paginator.prev_page
  json.next api_v1_schools_url(page: @paginator.next_page) if @paginator.next_page
end
json.perPage = @paginator.per_page
json.totalPages = @paginator.total_pages
json.totalCount = @paginator.total_size
json._embedded do
  json.schools @schools do |school|
    json.partial! partial: 'school', locals: { school: school }
  end
end
