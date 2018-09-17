class Admins::SchoolsController < ApplicationController
  before_action :authenticate_admin!
  helper_method :school

  def index
    @schools = School.all.paginate(page: params[:page])
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if school.save
      redirect_to admins_schools_path, notice: "#{school.name} has been created"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if school.update(school_params)
      redirect_to admins_schools_path, notice: "#{school.name} has been updated"
    end
  end

  def show
  end

  def destroy
    school.destroy
    redirect_to admins_schools_path, notice: "#{school.name} has been destroyed"
  end

  private

  def school_params
    params.require(:school).permit(:name)
  end

  def school
    @school ||= School.find(params[:id])
  end
end
