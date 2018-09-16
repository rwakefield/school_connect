require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  describe 'GET #show' do
    it 'will redirect if not logged in as user' do
      message = FactoryBot.create(:message)
      get message_path(message)
      assert_redirected_to user_session_path
    end

    it 'will respond success when logged in as user' do
      user = FactoryBot.create(:user, :connected)
      message = FactoryBot.create(:message)
      sign_in user
      get message_path(message)
      assert_response :success
    end
  end
end

