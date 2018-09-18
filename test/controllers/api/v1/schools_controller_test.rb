require 'test_helper'

class Api::V1::SchoolsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  describe 'GET #index' do
    it 'will respond with :unauthorized when not logged in' do
      get api_v1_schools_url(format: :json)
      assert_response :unauthorized
    end

    it 'will respond with :error logged_in without valid token' do
      api_user = FactoryBot.create(:api_user)
      sign_in api_user
      get api_v1_schools_url(format: :json)
      assert_response :error
    end

    it 'will respond with :success logged_in with a valid token' do
      api_user = FactoryBot.create(:api_user)
      sign_in api_user
      token = "Bearer #{JWTWrapper.encode({ api_user_id: api_user.id })}"
      get api_v1_schools_url(format: :json), headers: { 'Authorization': token }
      assert_response :success
    end
  end

  describe 'GET #show' do
    it 'will respond with :unauthorized when logged in with a valid token' do
      school = FactoryBot.create(:school)
      get api_v1_school_url(school, format: :json)
      assert_response :unauthorized
    end

    it 'will respond with :error when logged in with a valid token' do
      api_user = FactoryBot.create(:api_user)
      sign_in api_user
      school = FactoryBot.create(:school)
      get api_v1_school_url(school, format: :json)
      assert_response :error
    end

    it 'will respond with :success when logged in with a valid token' do
      api_user = FactoryBot.create(:api_user)
      sign_in api_user
      token = "Bearer #{JWTWrapper.encode({ api_user_id: api_user.id })}"
      school = FactoryBot.create(:school)
      get api_v1_school_url(school, format: :json), headers: { 'Authorization': token }
      assert_response :success
    end
  end
end
