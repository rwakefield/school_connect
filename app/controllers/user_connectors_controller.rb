class UserConnectorsController < ApplicationController
  before_action :authenticate_user!

  helper_method :user_connector_presenter

  def new
    @schools = School.all.order(:name)
  end

  def create
    if user_connector_presenter.can_set_school_ids?
      current_user.update_attributes(school_ids: user_connector_presenter.school_ids)
      redirect_to root_path
    else
      redirect_to new_user_connector_path, notice: 'You need at least one school to continue'
    end
  end

  private

  def user_connector_presenter
    UserConnectorPresenter.new(presented_user: current_user, connector_params: params)
  end

end
