module Transferwise
  class BorderlessAccount::Statement < APIResource
    def self.collection_path(resource_id = nil)
      "/#{API_VERSION}/borderless-accounts/statement"
    end
  end
end
