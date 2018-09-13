class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout

  private

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
