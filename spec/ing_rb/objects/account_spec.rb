require "spec_helper"

RSpec.describe IngRb::Account, active_session: true do
  it_behaves_like "list"

  describe "attributes" do
    let(:account) { described_class.all.first }

    it "contains an id" do
      expect(account.id).to eq("7de0041d-4f25-4b6c-a885-0bbeb1eab220")
    end

    it "contains an iban" do
      expect(account.iban).to eq("NL12INGB123456789")
    end

    it "contains a name" do
      expect(account.name).to eq("A. Van Dijk")
    end

    it "contains a currency" do
      expect(account.currency).to eq("EUR")
    end
  end

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
