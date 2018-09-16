class Api::V1::MessagesController < ApplicationController
  def index
    @school = School.find(params[:school_id])
    @paginator = JsonPaginator.new(collection: @school.school_messages.all, current_page: params[:page], per_page: params[:per_page])
    @messages = @paginator.paginated_collection
  end

  def show
    @school = School.find(params[:school_id])
    @message = @school.school_messages.find(params[:id])
  end
end
