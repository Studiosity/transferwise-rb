module Transferwise
  class APIResource
    include Transferwise::TransferwiseObject

    API_VERSION = 'v1'.freeze

    def self.class_name
      name.split('::')[-1]
    end

    def self.resource_path(resource_id)
      "#{collection_path}/#{resource_id}"
    end

    def self.collection_path(_resource_id = nil)
      if self == APIResource
        raise NotImplementedError,
              'APIResource is an abstract class. You should perform actions on its subclasses (Account, Transfer, etc.)'
      end

      "/#{API_VERSION}/#{CGI.escape(class_name.downcase)}s"
    end

    def self.create(params = {}, opts = {})
      response = Transferwise::Request.request(:post, collection_path, params, opts)
      convert_to_transferwise_object(response)
    end

    def self.list(filters = {}, headers = {}, resource_id = nil)
      response = Transferwise::Request.request(:get, collection_path(resource_id), filters, headers)
      convert_to_transferwise_object(response)
    end

    def self.get(resource_id, headers = {})
      response = Transferwise::Request.request(:get, resource_path(resource_id), {}, headers)
      convert_to_transferwise_object(response)
    end
  end
end
