module Transferwise
  class MultiCurrencyAccount < APIResource
    def self.balances(profile_id, headers)
      url = "/v3/profiles/#{profile_id}/balances"

      params = { 'types' => 'STANDARD' }
      response = Request.request(:get, url, params, headers)
      convert_to_transferwise_object(response)
    end

    def self.account_details(profile_id, headers)
      url = "/v3/profiles/#{profile_id}/account-details"

      response = Request.request(:get, url, {}, headers)
      convert_to_transferwise_object(response)
    end
  end
end
