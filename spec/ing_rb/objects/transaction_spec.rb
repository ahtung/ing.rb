require "spec_helper"

RSpec.describe IngRb::Transaction, active_session: true do
  it_behaves_like "list", "7de0041d-4f25-4b6c-a885-0bbeb1eab220"

  describe "attributes" do
    let(:transaction) { IngRb::Account.all.first.transactions.first }

    it "contains a transactionId" do
      expect(transaction.transactionId).to eq("trx123456789")
    end

    it "contains an endToEndId" do
      expect(transaction.endToEndId).to eq("EndToEndID1234567890")
    end
  end
end
