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

  describe 'POST #create' do
    it 'will redirect to message api when successful' do
      school = FactoryBot.create(:school)
      params = { message: { header: 'This is the header', body: 'This is the body' } }
      assert_difference('Message.count') do
        post api_v1_school_messages_url(school, format: :json), params: params
      end
    end
  end

  describe 'PATCH #update' do
    it 'will redirect to the message api when successul' do
      FactoryBot.create(:school_message)
      school = School.first
      message = Message.first
      params = { message: { header: 'new header'} }
      patch api_v1_school_message_url(school, message, format: :json), params: params
      assert_redirected_to api_v1_school_message_url(school, message, format: :json)
    end
  end

  describe 'DELETE #delete' do
    it 'will redirect to the message api when successul' do
      FactoryBot.create(:school_message)
      school = School.first
      message = Message.first
      assert_difference 'Message.count', -1 do
        delete api_v1_school_message_url(school, message, format: :json)
      end
    end
  end
end
