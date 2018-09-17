class Api::V1::SchoolsController < ApiController
  helper_method :paginator, :schools, :school

  def index
  end

  def show
  end

  private

  def paginator
    @paginator ||= JsonPaginator.new(collection: School.all, current_page: params[:page], per_page: params[:per_page])
  end

  def school
    @school ||= School.find(params[:id])
  end

  def schools
    @schools ||= paginator.paginated_collection
  end
end
