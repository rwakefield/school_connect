class MessagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @message = Message.find(params[:id])
  end
end
