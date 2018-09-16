require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  describe 'GET #show' do
    it 'will redirect if not logged in as user' do
      FactoryBot.create(:school_message)
      message = Message.first
      school = School.first
      get school_message_path(school, message)
      assert_redirected_to user_session_path
    end

    it 'will redirect when logged in as user and user is not attached to school' do
      FactoryBot.create(:school_message)
      school = School.first
      message = Message.first
      user = FactoryBot.create(:user, :connected)
      sign_in user
      get school_message_path(school, message)
      assert_redirected_to root_path
    end

    it 'will respond success when logged in as user and user is attached to school' do
      FactoryBot.create(:school_message)
      school = School.first
      message = Message.first
      user = FactoryBot.create(:user, :connected, schools: [school])
      sign_in user
      get school_message_path(school, message)
      assert_response :success
    end
  end
end

