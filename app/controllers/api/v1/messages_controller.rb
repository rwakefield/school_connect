class Api::V1::MessagesController < ApiController
  helper_method :messages, :message, :paginator, :school

  def index
  end

  def show
  end

  def create
    @message = school.school_messages.new(message_params)

    if message.save
      redirect_to api_v1_school_message_url(school, message, format: :json)
    else
      render json: message.errors, status: :unprocessable_entity
    end
  end

  def update
    if message.update(message_params)
      redirect_to api_v1_school_message_url(school, message, format: :json)
    else
      render json: message.errors, status: :unprocessable_entity
    end
  end

  def destroy
    message.destroy
    redirect_to api_v1_school_messages_url(school, format: :json)
  end

  private

  def message
    @message ||= school.school_messages.find(params[:id])
  end

  def messages
    @messages ||= paginator.paginated_collection
  end

  def message_params
    params.require(:message).permit(:header, :body)
  end

  def paginator
    @paginator ||= JsonPaginator.new(collection: school.school_messages, current_page: params[:page], per_page: params[:per_page])
  end

  def school
    @school ||= School.find(params[:school_id])
  end
end
