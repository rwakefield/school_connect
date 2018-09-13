require 'test_helper'

describe 'Admin' do
  it 'must be valid' do
    admin = build :admin
    admin.valid?.must_equal true
  end

  describe 'validations' do
    it 'must validate presence of email' do
      admin = build :admin, email: nil
      admin.valid?.must_equal false
      admin.errors.full_messages.must_equal ["Email can't be blank"]
    end

    it 'must validate presence of password' do
      admin = build :admin, password: nil
      admin.valid?.must_equal false
      admin.errors.full_messages.must_equal ["Password can't be blank", "Password confirmation doesn't match Password"]
    end

    it 'must validate matching of password confirmation' do
      admin = build :admin, password_confirmation: 'not your password bro'
      admin.valid?.must_equal false
      admin.errors.full_messages.must_equal ["Password confirmation doesn't match Password"]
    end

    it 'must validate format of email' do
      admin = build :admin, email: 'not an email bro'
      admin.valid?.must_equal false
      admin.errors.full_messages.must_equal ['Email is invalid']
    end
  end
end
