require 'test_helper'

class Api::V1::SchoolsControllerTest < ActionDispatch::IntegrationTest
  describe 'GET #index' do
    it 'will respond with :success' do
      get api_v1_schools_url(format: :json)
      assert_response :success
    end
  end

  describe 'GET #show' do
    it 'will respond with :success' do
      school = FactoryBot.create(:school)
      get api_v1_school_url(school, format: :json)
      assert_response :success
    end
  end
end
