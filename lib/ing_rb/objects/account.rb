module IngRb
  # Account
  class Account
    include IngRb::Shared

    implements :list

    attr_reader :id, :iban, :name

    def initialize(hsh = {})
      @id = hsh["id"]
      @iban = hsh["iban"]
      @name = hsh["name"]
    end

    def self.url()
      "/v1/accounts"
    end

    def transactions
      IngRb::Transaction.all(@id)
    end
  end
end
