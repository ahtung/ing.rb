module IngRb
  # Transaction
  class Transaction
    include IngRb::Shared

    implements :list

    attr_reader :booked, :pending

    def initialize(hsh = {})
      @booked = hsh["booked"]
      @pending = hsh["pending"]
    end

    def self.url(account_id)
      "/v1/accounts/#{account_id}/transactions"
    end
  end
end
