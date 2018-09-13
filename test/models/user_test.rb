require 'test_helper'

describe 'User' do
  it 'must be valid' do
    user = build :user
    user.valid?.must_equal true
  end

  describe 'validations' do
    it 'must validate presence of email' do
      user = build :user, email: nil
      user.valid?.must_equal false
      user.errors.full_messages.must_equal ["Email can't be blank"]
    end

    it 'must validate presence of password' do
      user = build :user, password: nil
      user.valid?.must_equal false
      user.errors.full_messages.must_equal ["Password can't be blank", "Password confirmation doesn't match Password"]
    end

    it 'must validate matching of password confirmation' do
      user = build :user, password_confirmation: 'not your password bro'
      user.valid?.must_equal false
      user.errors.full_messages.must_equal ["Password confirmation doesn't match Password"]
    end

    it 'must validate format of email' do
      user = build :user, email: 'not an email bro'
      user.valid?.must_equal false
      user.errors.full_messages.must_equal ['Email is invalid']
    end
  end
end
