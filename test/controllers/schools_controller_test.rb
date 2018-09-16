require 'test_helper'

class SchoolsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  describe 'GET #index' do
    it 'will redirect if not logged in as user' do
      get schools_path
      assert_redirected_to user_session_path
    end

    it 'will respond success when logged in as user' do
      user = FactoryBot.create(:user, :connected)
      sign_in user
      get schools_path
      assert_response :success
    end
  end

  describe 'GET #show' do
    it 'will redirect if not logged in as user' do
      school = FactoryBot.create(:school)
      get school_path(school)
      assert_redirected_to user_session_path
    end

    it 'will respond success when logged in as user' do
      school = FactoryBot.create(:school)
      user = FactoryBot.create(:user, :connected, schools: [school])
      sign_in user
      get school_path(school)
      assert_response :success
    end
  end
end
