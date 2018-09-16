require 'test_helper'

describe 'Message' do
  it 'must be valid' do
    message = build :message
    message.valid?.must_equal true
  end

  describe 'validations' do
    it 'must validate persence of header' do
      message = build :message, header: nil
      message.valid?.must_equal false
      message.errors.full_messages.must_equal ["Header can't be blank"]
    end

    it 'must validate persence of body' do
      message = build :message, body: nil
      message.valid?.must_equal false
      message.errors.full_messages.must_equal ["Body can't be blank"]
    end

    it 'must validate inclusion of type' do
      message = build :message, type: nil
      message.valid?.must_equal false
      message.errors.full_messages.must_equal ['Type is not included in the list']
    end
  end
end
