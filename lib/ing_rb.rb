require_relative "ing_rb/logger"
require_relative "ing_rb/version"
require_relative "ing_rb/configuration"

module IngRb
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end
