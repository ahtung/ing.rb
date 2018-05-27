module IngRb
  # Configuration
  class Configuration
    attr_accessor :url, :page_size

    def initialize
      @url = ""
      @page_size = 10
    end
  end
end
