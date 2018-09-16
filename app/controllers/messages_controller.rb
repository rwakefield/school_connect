class MessagesController < ApplicationController
  before_action :authenticate_user!

  def show
    school = School.find(params[:school_id])
    if current_user.schools.include?(school)
      @message = school.school_messages.find(params[:id])
    else
      redirect_to root_path, notice: 'You are doing something wrong'
    end
  end
end
