module Transferwise
  #
  # Transfer API
  #
  # https://api-docs.transferwise.com/partners#transfers
  #
  class Transfer < APIResource
    def self.cancel(transfer_id, headers)
      url = "#{resource_path(transfer_id)}/cancel"

      params = { 'transferId' => transfer_id }
      response = Request.request(:put, url, params, headers)
      convert_to_transferwise_object(response)
    end

    def self.fund(transfer_id, profile_id, headers)
      url = "/v3/profiles/#{profile_id}/transfers/#{transfer_id}/payments"

      params = { 'type' => 'BALANCE' }
      response = Request.request(:post, url, params, headers)
      convert_to_transferwise_object(response)
    end
  end
end
