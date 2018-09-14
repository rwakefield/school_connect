require 'test_helper'

class Admins::DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  describe 'GET #index' do
    it 'will not have a root to admins path if not logged in as admin' do
      assert_raises ActionController::RoutingError do
        get admins_root_path
      end
    end

    it 'will not have a root to admins when logged in as user' do
      assert_raises ActionController::RoutingError do
        user = FactoryBot.create(:user)
        sign_in user
        get admins_root_path
      end
    end

    it 'will respond :success when logged in as an admin' do
      admin = FactoryBot.create(:admin)
      sign_in admin
      get admins_root_path
      assert_response :success
    end
  end
end
