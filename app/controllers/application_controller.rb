class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  layout :layout

  private

  def layout
    current_user ? 'application' : 'devise'
  end
end
