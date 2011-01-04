module OmniAuth
  module Strategies
    # Authenticate to CodePath utilizing OAuth 2.0 and retrieve
    # basic user information.
    #
    # @example Basic Usage
    #   use OmniAuth::Strategies::CodePath, 'client_id', 'client_secret'
    class CodePath < OAuth2
      cattr_accessor :base_uri
      # @param [Rack Application] app standard middleware application parameter
      # @param [String] client_id the application id as [registered on Facebook](http://www.facebook.com/developers/)
      # @param [String] client_secret the application secret as registered on Facebook
      # @option options [String] :scope ('email,offline_access') comma-separated extended permissions such as `email` and `manage_pages`
      def initialize(app, client_id = nil, client_secret = nil, options = {}, &block)
        super(app, :coder_path, client_id, client_secret, {
          :site => self.class.base_uri.presence || "http://localhost:3000",
          :authorize_path => "/oauth/authorize",
          :access_token_path => "/oauth/token"
        }, options, &block)
      end
      
      def request_phase
        options[:response_type] ||= "code"
        super
      end

      def callback_phase
        options[:grant_type] ||= 'authorization_code'
        super
      end

      def user_data
        @data ||= MultiJson.decode(@access_token.get('/api/v1/user.json', {}, {}))['user']
      end

      def user_info
        {
          'nickname' => user_data["twitter_name"],
          'email' => (user_data["email"] if user_data["email"]),
          'first_name' => user_data["name"].split(" ").first,
          'last_name' => user_data["name"].split(" ").last,
          'name' => user_data['name']
        }
      end
      
      def auth_hash
        OmniAuth::Utils.deep_merge(super, {
          'uid' => user_data['id'],
          'user_info' => user_info,
          'extra' => {'user_hash' => user_data}
        })
      end
      
      
    end
  end
end

