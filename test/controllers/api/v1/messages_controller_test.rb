require 'test_helper'

class Api::V1::MessagesControllerTest < ActionDispatch::IntegrationTest
  describe 'GET #index' do
    it 'will respond with :success' do
      school = FactoryBot.create(:school)
      get api_v1_school_messages_url(school, format: :json)
      assert_response :success
    end
  end

  describe 'GET #show' do
    it 'will respond with :success' do
      FactoryBot.create(:school_message)
      school = School.first
      message = Message.first
      get api_v1_school_message_url(school, message, format: :json)
      assert_response :success
    end
  end
end
