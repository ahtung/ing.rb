module IngRb
  # Account
  class Account
    include IngRb::Shared

    implements :list

    attr_reader :id, :iban, :name, :currency

    def initialize(hsh = {})
      @id = hsh["id"]
      @iban = hsh["iban"]
      @name = hsh["name"]
      @currency = hsh["currency"]
    end

    def self.url
      "/v1/accounts"
    end

    def self.container
      "account-list"
    end

    def transactions
      IngRb::Transaction.all(@id)
    end
  end
end
