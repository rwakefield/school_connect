require 'test_helper'

describe 'ApiUser' do
  it 'must be valid' do
    api_user = build :api_user
    api_user.valid?.must_equal true
  end
end
