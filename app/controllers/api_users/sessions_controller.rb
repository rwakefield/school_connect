class ApiUsers::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }

  def new
  end

  def create
    api_user = ApiUser.find_by(email: session_params[:email])
    if api_user && api_user.valid_password?(session_params[:password])
      sign_in api_user
      render json: { "Bearer Token" => JWTWrapper.encode({ api_user_id: api_user.id }) }
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
