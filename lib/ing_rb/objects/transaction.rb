module IngRb
  # Transaction
  class Transaction
    include IngRb::Shared

    implements :list

    attr_reader :transactionId, :endToEndId

    def initialize(hsh = {})
      @transactionId = hsh["transactionId"]
      @endToEndId = hsh["endToEndId"]
    end

    def self.url(account_id)
      "/v1/accounts/#{account_id}/transactions"
    end

    def self.all(account_id)
      Enumerator.new do |yielder|
        older_url = url(account_id)
        loop do
          results = Client.raw_send_method(:get, older_url)
          json = JSON.parse(results.body)
          json["transactions"]["booked"].map { |item| yielder << new(item) }
          raise StopIteration if json["_links"].nil?
          older_url = json["_links"]["next"]
        end
      end.lazy
    end
  end
end
