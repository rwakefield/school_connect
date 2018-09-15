class SchoolsController < ApplicationController
  before_action :authenticate_user!

  def index
    @schools = School.all.paginate(page: params[:page])
  end

  def show
    @school = School.find(params[:id])
  end
end
