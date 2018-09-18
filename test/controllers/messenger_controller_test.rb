require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  describe 'GET #index' do
    it 'must not have access to route if signed in as user' do
      assert_raises ActionController::RoutingError do
        user = FactoryBot.create(:user)
        sign_in user
        get messenger_path
      end
    end

    it 'must respond with :success if not signed in as user' do
      get messenger_path
      assert_response :success
    end
  end
end
