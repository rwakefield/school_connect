class JsonPaginator
  attr_reader :per_page, :current_page

  def initialize(collection:, current_page: nil, per_page: nil)
    @collection = collection
    @current_page = current_page || '1'
    @per_page = per_page || '10'
  end

  def paginated_collection
    collection.page(current_page.to_i).per_page(per_page.to_i)
  end

  def prev_page
    return nil if current_page == '1'
    (current_page.to_i - 1).to_s
  end

  def next_page
    return nil if current_page == total_pages
    (current_page.to_i + 1).to_s
  end

  def total_pages
    return '1' if total_size == '0'
    size = total_size.to_i
    per = per_page.to_i
    (size/per + (size % per)).to_s
  end

  def total_size
    collection.count.to_s
  end

  private

  attr_reader :collection
end
