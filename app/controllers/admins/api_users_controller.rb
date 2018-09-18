class Admins::ApiUsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @api_users = ApiUser.all
    @api_user_ids = @api_users.map(&:id).join(',')
  end

  def destroy
    ids = Array(params[:id].split(','))
    ids.each do |id|
      ApiUser.find(id).destroy
    end
    redirect_to admins_api_users_path, notice: "Deleted #{ids.size == 1 ? 'user' : 'all users'}"
  end
end
