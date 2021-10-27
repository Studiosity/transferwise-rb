module Transferwise
  class BorderlessAccount::Transaction < APIResource
    def self.collection_path(resource_id = nil)
      "/#{API_VERSION}/borderless-accounts/#{resource_id}/transactions"
    end
  end
end
