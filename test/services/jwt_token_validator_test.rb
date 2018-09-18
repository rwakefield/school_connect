require 'test_helper'


describe 'JwtTokenValidator' do
  describe '#valid?' do
    before do
      @wrapper = JWTWrapper
      @request_struct = Struct.new(:headers)
    end

    it 'will return false if the request has no headers' do
      api_user = create :api_user
      request = @request_struct.new(nil)
      validator = JwtTokenValidator.new(api_user: api_user, request: request, wrapper: @wrapper)
      validator.valid?.must_equal false
    end

    it 'will return false if thee request header does not contain Authorization' do
      api_user = create :api_user
      request = @request_struct.new({})
      validator = JwtTokenValidator.new(api_user: api_user, request: request, wrapper: @wrapper)
      validator.valid?.must_equal false
    end

    it 'will return false if the token is prepended' do
      api_user = create :api_user
      token = @wrapper.encode({ api_user_id: api_user.id })
      headers = { 'Authorization' => "#{token}" }
      request = @request_struct.new(headers)
      validator = JwtTokenValidator.new(api_user: api_user, request: request, wrapper: @wrapper)
      validator.valid?.must_equal false
    end

    it 'will return false if the strategy is not Bearer' do
      api_user = create :api_user
      token = @wrapper.encode({ api_user_id: api_user.id })
      headers = { 'Authorization' => "NOTBEARER #{token}" }
      request = @request_struct.new(headers)
      validator = JwtTokenValidator.new(api_user: api_user, request: request, wrapper: @wrapper)
      validator.valid?.must_equal false
    end

    it 'will return false if the token does not match the encoded token' do
      api_user = create :api_user
      token = @wrapper.encode({ api_user_id: api_user.id })
      headers = { 'Authorization' => "Bearer NOT_THE_TOKEN_YOU_ARE_LOOKING_FOR" }
      request = @request_struct.new(headers)
      validator = JwtTokenValidator.new(api_user: api_user, request: request, wrapper: @wrapper)
      validator.valid?.must_equal false
    end

    it 'will return false if the token does not have the key api_user_id' do
      api_user = create :api_user
      token = @wrapper.encode({ not_the_token_you_are_looking_for: api_user.id })
      headers = { 'Authorization' => "Bearer #{token}" }
      request = @request_struct.new(headers)
      validator = JwtTokenValidator.new(api_user: api_user, request: request, wrapper: @wrapper)
      validator.valid?.must_equal false
    end

    it 'will return false if the token does not exist' do
      api_user = create :api_user
      token = @wrapper.encode({ api_user_id: api_user.id })
      headers = { 'Authorization' => nil }
      request = @request_struct.new(headers)
      validator = JwtTokenValidator.new(api_user: api_user, request: request, wrapper: @wrapper)
      validator.valid?.must_equal false
    end

    it 'will return true with a valid setup' do
      api_user = create :api_user
      token = @wrapper.encode({ api_user_id: api_user.id })
      headers = { 'Authorization' => "Bearer #{token}" }
      request = @request_struct.new(headers)
      validator = JwtTokenValidator.new(api_user: api_user, request: request, wrapper: @wrapper)
      validator.valid?.must_equal true
    end
  end
end
