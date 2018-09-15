class Api::V1::SchoolsController < ApplicationController
  def index
    @paginator = JsonPaginator.new(collection: School.all, current_page: params[:page], per_page: params[:per_page])
    @schools = @paginator.paginated_collection
  end

  def show
    @school = School.find(params[:id])
  end
end
