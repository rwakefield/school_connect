class ApiUsers::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }

  def new
  end

  def create
    require "readline"; require "pry"; binding.pry 
  end
end
