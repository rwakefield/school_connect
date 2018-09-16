require 'test_helper'

describe 'UserConnector' do
  it 'must be valid' do
    user_connector = build :user_connector
    user_connector.valid?.must_equal true
  end
end
