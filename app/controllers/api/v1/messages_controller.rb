class Api::V1::MessagesController < ApiController
  def index
    @school = School.find(params[:school_id])
    @paginator = JsonPaginator.new(collection: @school.school_messages, current_page: params[:page], per_page: params[:per_page])
    @messages = @paginator.paginated_collection
  end

  def show
    @school = School.find(params[:school_id])
    @message = @school.school_messages.find(params[:id])
  end

  def create
    school = School.find(params[:school_id])
    message = school.school_messages.new(message_params)

    if message.save
      redirect_to api_v1_school_message_url(school, message, format: :json)
    else
      render json: message.errors, status: :unprocessable_entity
    end
  end

  def update
    school = School.find(params[:school_id])
    message = school.school_messages.find(params[:id])

    if message.update(message_params)
      redirect_to api_v1_school_message_url(school, message, format: :json)
    else
      render json: message.errors, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:header, :body)
  end
end
