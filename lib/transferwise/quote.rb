module Transferwise
  #
  # Quote API
  #
  # https://api-docs.transferwise.com/partners#quotes
  #
  class Quote < APIResource
    def self.collection_path(_ = nil)
      '/v2/quotes'
    end
  end
end
