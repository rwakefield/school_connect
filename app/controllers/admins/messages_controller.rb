class Admins::MessagesController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    school = School.find(params[:school_id])
    message = school.school_messages.find(params[:id])
    message.destroy
    redirect_to admins_school_path(school), notice: "Message #{message.id} has been destroyed"
  end
end
