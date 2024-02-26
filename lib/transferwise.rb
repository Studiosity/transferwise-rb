# Transferwise Ruby bindings
require 'open-uri'
require 'oauth2'
require 'rest-client'
require 'json'

# Version
require 'transferwise/version'

# Oauth2 Authentication
require 'transferwise/oauth'

# ActiveSupport extensions
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/string/inflections'

# Resources
require 'transferwise/transferwise_object'
require 'transferwise/api_resource'
require 'transferwise/profile'
require 'transferwise/quote'
require 'transferwise/account'
require 'transferwise/transfer'
require 'transferwise/util'
require 'transferwise/rate'
require 'transferwise/request'
require 'transferwise/multi_currency_account'

# Errors
require 'transferwise/transferwise_error'

module Transferwise
  class << self
    attr_accessor :mode, :access_token

    def api_base
      live_url = 'https://api.transferwise.com'
      test_url = 'https://api.sandbox.transferwise.tech'
      @api_base ||= mode == 'live' ? live_url : test_url
    end

    def authorization_base
      live_url = 'https://api.transferwise.com'
      test_url = 'https://sandbox.transferwise.tech'
      @authorization_base ||= mode == 'live' ? live_url : test_url
    end
  end
end
