require "spec_helper"

RSpec.describe IngRb::Account, active_session: true do
  it_behaves_like "list"

  describe "transactions" do
    let(:account) { described_class.all.first }

    it "return some transactions" do
      expect(account.transactions.count).to be > 0
    end

    it "returns a IngRb::Transaction object" do
      transaction = account.transactions.first
      expect(transaction).to be_instance_of(IngRb::Transaction)
    end
  end
end
