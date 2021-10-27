module Transferwise
  class BorderlessAccount::BalanceCurrency < APIResource
    def self.collection_path(resource_id = nil)
      "/#{API_VERSION}/borderless-accounts/balance-currencies"
    end
  end
end
