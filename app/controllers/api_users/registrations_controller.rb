class ApiUsers::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }

  def new
    @api_user = ApiUser.new
  end

  def create
    @api_user = ApiUser.new(registration_params)
    if @api_user.save
      render json: { "Bearer Token" => JWTWrapper.encode({ api_user_id: @api_user.id }) }
    else
      render :new
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:email, :password)
  end
end
