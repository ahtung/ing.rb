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

    def self.send_method(method, url, payload = {})
      IngRb.logger.debug "#{method.upcase} #{url}"
      faraday_response = connection.send(method, url, payload)
      json_response = JSON.parse(faraday_response.body)
      raise json_response["Error"].first["error_description"] if json_response.key?("Error")
      json_response["Response"]
    end

    def self.raw_send_method(method, url, payload = {})
      IngRb.logger.debug "#{method.upcase} #{url}"
      connection.send(method, url, payload)
    end
  end
end
