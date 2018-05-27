require "spec_helper"

describe IngRb::Client do
  describe "." do
    describe "connection" do
      it "returns a Faraday::Connection object" do
        IngRb.configure do |ingrb_config|
          ingrb_config.url = "https://api.sandbox.ing.com"
        end

        expect(described_class.connection).to be_instance_of(Faraday::Connection)
      end
    end
  end
end
