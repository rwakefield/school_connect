require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  describe 'GET #index' do
    it 'will redirect when not logged in' do
      get root_path
      assert_redirected_to user_session_path
    end

    it 'will respond :success when logged in' do
      user = FactoryBot.create(:user)
      sign_in user
      get root_path
      assert_response :success
    end
  end
end
