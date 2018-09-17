class ApiUsers::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }

  def new
  end

  def create
    @api_user = ApiUser.new(email: params[:email], password: params[:password], password_confirmation: params[:password])

    if @api_user.save
      render json: response_json
    else
      render :new
    end
  end

  private

  def response_json
    links_section = { "#POST" => new_api_user_session_url }
    params_section = { email: @api_user.email, password: params[:password] }
    { "_links" => links_section, "params" => params_section }.to_json
  end
end
