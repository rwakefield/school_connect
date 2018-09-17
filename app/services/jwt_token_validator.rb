class JwtTokenValidator
  def initialize(api_user:, request:, wrapper:)
    @api_user = api_user
    @request = request
    @wrapper = wrapper
    @token = {}
    @strategy = ""
  end

  def valid?
    extract_strategy_and_token_from_header
    return false unless strategy == 'bearer'
    token.has_key?('api_user_id') && api_user.id == token['api_user_id']
  end

  private

  def authorization_header
    @authorization_header ||= begin
                                @request.headers['Authorization'].to_s.split
                              rescue
                                nil
                              end
  end

  def extract_strategy_and_token_from_header
    return unless authorization_header && authorization_header.size == 2
    @strategy = authorization_header[0].downcase
    @token = @wrapper.decode(authorization_header[1]) || {}
  end

  attr_reader :api_user, :request, :wrapper
  attr_accessor :strategy, :token
end
