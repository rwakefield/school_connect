require 'test_helper'

class Admins::ApiUsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  describe 'GET #index' do
    it 'will not have a root to admins path if not logged in as admin' do
      assert_raises ActionController::RoutingError do
        get admins_api_users_path
      end
    end

    it 'will not have a root to admins when logged in as user' do
      assert_raises ActionController::RoutingError do
        user = FactoryBot.create(:user)
        sign_in user
        get admins_api_users_path
      end
    end

    it 'will respond :success when logged in as an admin with no users' do
      admin = FactoryBot.create(:admin)
      sign_in admin
      get admins_api_users_path
      assert_response :success
    end

    it 'will respond :success when logged in as an admin with users' do
      FactoryBot.create(:api_user)
      admin = FactoryBot.create(:admin)
      sign_in admin
      get admins_api_users_path
      assert_response :success
    end
  end

  describe 'DELETE #destroy' do
    it 'will not have a root to admins path if not logged in as admin' do
      assert_raises ActionController::RoutingError do
        api_user = FactoryBot.create(:api_user)
        delete admins_api_user_path(api_user)
      end
    end

    it 'will not have a root to admins when logged in as user' do
      assert_raises ActionController::RoutingError do
        user = FactoryBot.create(:user)
        sign_in user
        api_user = FactoryBot.create(:api_user)
        delete admins_api_user_path(api_user)
      end
    end

    it 'will destroy user' do
      api_user = FactoryBot.create(:api_user)
      admin = FactoryBot.create(:admin)
      sign_in admin
      assert_difference 'ApiUser.count',-1 do
        delete admins_api_user_path(api_user)
      end
    end

    it 'will destroy all users when passed ids in format of 1,2,3,4' do
      5.times do |i|
        FactoryBot.create(:api_user, email: "email#{i}@email.com")
      end
      ids = ApiUser.all.map(&:id).join(',')
      admin = FactoryBot.create(:admin)
      sign_in admin
      assert_difference 'ApiUser.count',-5 do
        delete admins_api_user_path(ids)
      end
    end
  end
end
