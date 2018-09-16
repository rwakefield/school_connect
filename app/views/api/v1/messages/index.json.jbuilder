json._links do
  json.self api_v1_school_messages_url(page: @paginator.current_page)
  json.prev api_v1_school_messages_url(page: @paginator.prev_page) if @paginator.prev_page
  json.next api_v1_school_messages_url(page: @paginator.next_page) if @paginator.next_page
end
json.perPage = @paginator.per_page
json.totalPages = @paginator.total_pages
json.totalCount = @paginator.total_size
json._embedded do
  json.messages @messages do |message|
    json.partial! partial: 'message', locals: { school: @school, message: message }
  end
end
