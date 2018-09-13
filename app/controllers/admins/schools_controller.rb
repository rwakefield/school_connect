class Admins::SchoolsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to admins_schools_path, notice: "#{@school.name} has been created"
    else
      render 'new'
    end
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update(school_params)
      redirect_to admins_schools_path, notice: "#{@school.name} has been updated"
    end
  end

  def show
    @school = School.find(params[:id])
  end

  def destroy
    @school = School.find(params[:id])
    @school.destroy
    redirect_to admins_schools_path, notice: "#{@school.name} has been destroyed"
  end

  private

  def school_params
    params.require(:school).permit(:name)
  end
end
