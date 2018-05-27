require "securerandom"
require "faraday"
require "faraday_middleware"

Dir[File.dirname(__FILE__) + "/objects/**/*.rb"].each { |f| require f }

module IngRb
  # Client
  class Client
    def self.connection
      @connection ||= Faraday.new(url: IngRb.configuration.url) do |config|
        config.request :json
        config.request :multipart
        config.adapter Faraday.default_adapter
      end
    end
  end
end
