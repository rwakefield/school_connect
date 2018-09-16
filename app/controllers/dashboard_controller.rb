class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @schools = current_user.schools.order(:name)
  end
end
