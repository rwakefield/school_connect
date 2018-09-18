require 'test_helper'

class Api::V1::MessagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  describe 'GET #index' do
    it 'will respond with :unauthorized when not logged in' do
      school = FactoryBot.create(:school)
      get api_v1_school_messages_url(school, format: :json)
      assert_response :unauthorized
    end

    it 'will respond with :error when logged in with an invalid token' do
      api_user = FactoryBot.create(:api_user)
      sign_in api_user
      school = FactoryBot.create(:school)
      get api_v1_school_messages_url(school, format: :json)
      assert_response :error
    end

    it 'will respond with :success when logged in with a valid token' do
      api_user = FactoryBot.create(:api_user)
      sign_in api_user
      token = "Bearer #{JWTWrapper.encode({ api_user_id: api_user.id })}"
      school = FactoryBot.create(:school)
      get api_v1_school_messages_url(school, format: :json), headers: { 'Authorization': token }
      assert_response :success
    end
  end

  describe 'GET #show' do
    it 'will respond with :unauthorized when not logged in' do
      FactoryBot.create(:school_message)
      school = School.first
      message = Message.first
      get api_v1_school_message_url(school, message, format: :json)
      assert_response :unauthorized
    end

    it 'will respond with :error when logged in with a invalid token' do
      api_user = FactoryBot.create(:api_user)
      sign_in api_user
      FactoryBot.create(:school_message)
      school = School.first
      message = Message.first
      get api_v1_school_message_url(school, message, format: :json)
      assert_response :error
    end

    it 'will respond with :success when logged in with a valid token' do
      api_user = FactoryBot.create(:api_user)
      sign_in api_user
      token = "Bearer #{JWTWrapper.encode({ api_user_id: api_user.id })}"
      FactoryBot.create(:school_message)
      school = School.first
      message = Message.first
      get api_v1_school_message_url(school, message, format: :json), headers: { 'Authorization': token }
      assert_response :success
    end
  end

  describe 'POST #create' do
    it 'will redirect to message api when successful' do
      api_user = FactoryBot.create(:api_user)
      sign_in api_user
      token = "Bearer #{JWTWrapper.encode({ api_user_id: api_user.id })}"
      school = FactoryBot.create(:school)
      params = { message: { header: 'This is the header', body: 'This is the body' } }
      assert_difference('Message.count') do
        post api_v1_school_messages_url(school, format: :json), params: params, headers: { 'Authorization': token }
      end
    end
  end

  describe 'PATCH #update' do
    it 'will redirect to the message api when successul' do
      api_user = FactoryBot.create(:api_user)
      sign_in api_user
      token = "Bearer #{JWTWrapper.encode({ api_user_id: api_user.id })}"
      FactoryBot.create(:school_message)
      school = School.first
      message = Message.first
      params = { message: { header: 'new header'} }
      patch api_v1_school_message_url(school, message, format: :json), params: params, headers: { 'Authorization': token }
      assert_redirected_to api_v1_school_message_url(school, message, format: :json)
    end
  end

  describe 'DELETE #delete' do
    it 'will redirect to the message api when successul' do
      api_user = FactoryBot.create(:api_user)
      sign_in api_user
      token = "Bearer #{JWTWrapper.encode({ api_user_id: api_user.id })}"
      FactoryBot.create(:school_message)
      school = School.first
      message = Message.first
      assert_difference 'Message.count', -1 do
        delete api_v1_school_message_url(school, message, format: :json), headers: { 'Authorization': token }
      end
    end
  end
end
