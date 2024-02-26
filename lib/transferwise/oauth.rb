module Transferwise
  class OAuth
    attr_accessor :access_token

    def initialize(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
    end

    # Get the OAuth 2 client
    def client
      @client ||= ::OAuth2::Client.new(
        @client_id,
        @client_secret,
        {
          site: Transferwise.api_base,
          auth_scheme: :basic_auth
        }
      )
    end

    def authorize_client
      @authorize_client ||= ::OAuth2::Client.new(
        @client_id,
        @client_secret,
        {
          site: Transferwise.authorization_base,
          auth_scheme: :basic_auth
        }
      )
    end

    # Get the url to redirect a user to, pass the redirect_url you want the user
    # to be redirected back to.
    def authorize_url(redirect_url)
      authorize_client.auth_code.authorize_url(redirect_uri: redirect_url)
    end

    # Get the access token. You must pass the exact same redirect_url passed
    # to the authorize_url method
    def get_access_token(code, redirect_url)
      @access_token ||= client.auth_code.get_token(code, redirect_uri: redirect_url)
    end

    # This method is used to refresh the access token before it expires
    def refresh_token(access_token, opts = {})
      OAuth2::AccessToken.new(client, access_token, opts).refresh!
    end
  end
end
