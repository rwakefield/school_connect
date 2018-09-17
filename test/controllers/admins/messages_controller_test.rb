require 'test_helper'

class Admins::DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  describe 'DELETE #delete' do
    it 'will not have admins_school_message if not logged in as admin' do
      assert_raises ActionController::RoutingError do
        FactoryBot.create(:school_message)
        school = School.first
        message = Message.first
        delete admins_school_message_path(school, message)
      end
    end

    it 'will delete school when logged in as admin' do
      admin = FactoryBot.create(:admin)
      FactoryBot.create(:school_message)
      school = School.first
      message = Message.first
      sign_in admin
      assert_difference 'Message.count',-1 do
        delete admins_school_message_path(school, message)
      end
    end
  end
end
