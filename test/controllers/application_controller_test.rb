require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  it 'will redirect_to new_connector_path when logged in and not attached to a school' do
    user = FactoryBot.create(:user)
    sign_in user
    get root_path
    assert_redirected_to new_user_connector_path
  end
end
