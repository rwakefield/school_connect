class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :check_user_connectors, only: [:index]

  layout :layout

  private

  def check_user_connectors
    if current_user && current_user.schools.empty?
      redirect_to(new_user_connector_path) && return
    end
  end

  def layout
    if current_admin
      'admin'
    elsif current_user
      'application'
    else
      'devise'
    end
  end
end
