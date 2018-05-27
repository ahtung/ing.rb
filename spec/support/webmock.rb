require "webmock/rspec"
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    # ACCOUNT
    ## LIST
    stub_request(:get, "https://api.sandbox.ing.com/v1/accounts").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/accounts.json"))

    # TRANSACTION
    ## LIST
    stub_request(:get, "https://api.sandbox.ing.com/v1/accounts/7de0041d-4f25-4b6c-a885-0bbeb1eab220/transactions").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/transactions.json"))
    stub_request(:get, "https://api.sandbox.ing.com/v1/accounts/7de0041d-4f25-4b6c-a885-0bbeb1eab220/transactions?next=CQR23TABC").
      to_return(status: 200, body: File.new("spec/support/mocks/v1/transactions_page_2.json"))
  end
end
