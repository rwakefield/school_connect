class ApiController < ActionController::Base
  protect_from_forgery with: :null_session, if: Proc.new {|c| c.request.format.json? }

  before_action :authenticate_api_user!
  before_action :check_token!

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  private

  def check_token!
    unless JwtTokenValidator.new(api_user: current_api_user, request: request, wrapper: JWTWrapper).valid?
      sign_out current_api_user
      render json: 'Token invalid or expired!'.to_json, status: :unauthorised
    end
  end

  def render_unprocessable_entity_response(exception)
    render json: exception.record.errors, status: :unprocessable_entity
  end

  def render_not_found_response(exception)
    render json: { error: exception.message }, status: :not_found
  end
end
