class SchoolsController < ApplicationController
  before_action :authenticate_user!

  def index
    @schools = current_user.schools.paginate(page: params[:page])
  end

  def show
    @school = current_user.schools.find(params[:id])
  end
end
