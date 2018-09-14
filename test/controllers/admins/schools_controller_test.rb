require 'test_helper'

class Admins::DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  describe 'GET #index' do
    it 'will not have admins_schools_path if not logged in as admin' do
      assert_raises ActionController::RoutingError do
        get admins_schools_path
      end
    end

    it 'will respond :success when logged in as admin' do
      admin = FactoryBot.create(:admin)
      sign_in admin
      get admins_schools_path
      assert_response :success
    end
  end

  describe 'GET #new' do
    it 'will not have new_admins_school_path if not logged in as admin' do
      assert_raises ActionController::RoutingError do
        get new_admins_school_path
      end
    end

    it 'will respond :success when logged in as admin' do
      admin = FactoryBot.create(:admin)
      sign_in admin
      get new_admins_school_path
      assert_response :success
    end
  end

  describe 'GET #show' do
    it 'will not have admins_school_path if not logged in as admin' do
      assert_raises ActionController::RoutingError do
        school = FactoryBot.create(:school)
        get admins_school_path(school)
      end
    end

    it 'will respond :success when logged in as admin' do
      admin = FactoryBot.create(:admin)
      school = FactoryBot.create(:school)
      sign_in admin
      get admins_school_path(school)
      assert_response :success
    end
  end

  describe 'POST #create' do
    it 'will not have admins_schools if not logged in as admin' do
      assert_raises ActionController::RoutingError do
        post admins_schools_path, params: { school: { name: nil } }
      end
    end

    it 'will not create a school when logged in as admin and passed invalid params' do
      admin = FactoryBot.create(:admin)
      sign_in admin
      assert_no_difference('School.count') do
        post admins_schools_path, params: { school: { name: nil } }
      end
    end

    it 'will create a school when logged in as admin and passed valid params' do
      admin = FactoryBot.create(:admin)
      sign_in admin
      assert_difference('School.count') do
        post admins_schools_path, params: { school: { name: 'School Name' } }
      end
    end
  end

  describe 'PATCH #update' do
    it 'will not have admins_school if not logged in as admin' do
      assert_raises ActionController::RoutingError do
        school = FactoryBot.create(:school)
        patch admins_school_path(school), params: { school: { name: nil } }
      end
    end

    it 'will update a school when logged in as admin and passed valid params' do
      admin = FactoryBot.create(:admin)
      school = FactoryBot.create(:school)
      sign_in admin
      patch admins_school_path(school), params: { school: { name: 'Updated School Name' } }
      assert_response :found
      assert_redirected_to admins_schools_path
      school.reload.name.must_equal 'Updated School Name'
    end
  end

  describe 'DELETE #delete' do
    it 'will not have admins_school if not logged in as admin' do
      assert_raises ActionController::RoutingError do
        school = FactoryBot.create(:school)
        delete admins_school_path(school)
      end
    end

    it 'will delete school when logged in as admin' do
      admin = FactoryBot.create(:admin)
      school = FactoryBot.create(:school)
      sign_in admin
      delete admins_school_path(school)
      assert_response :found
      assert_redirected_to admins_schools_path
      School.count.must_equal 0
    end
  end
end
