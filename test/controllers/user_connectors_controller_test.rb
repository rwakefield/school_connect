require 'test_helper'

class UserConnectorsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  describe 'GET #new' do
    it 'will redirect if not logged in as user' do
      get new_user_connector_path
      assert_redirected_to user_session_path
    end

    it 'will respond success when logged in as user' do
      user = FactoryBot.create(:user, :connected)
      sign_in user
      get new_user_connector_path
      assert_response :success
    end
  end

  describe 'POST #create' do
    it 'will redirect if not logged in as user' do
      get new_user_connector_path
      assert_redirected_to user_session_path
    end

    it 'will redirect when logged in as a user and not passed school_ids' do
      user = FactoryBot.create(:user, :connected)
      school = FactoryBot.create(:school)
      sign_in user
      post user_connectors_path, params: { user_connector: { school_ids: [] } }
      assert_redirected_to new_user_connector_path
    end

    it 'will redirect_to root_path when logged in as user and passed school_ids' do
      user = FactoryBot.create(:user, :connected)
      school = FactoryBot.create(:school)
      sign_in user
      post user_connectors_path, params: { user_connector: { school_ids: [school.id] } }
      assert_redirected_to root_path
    end
  end
end
