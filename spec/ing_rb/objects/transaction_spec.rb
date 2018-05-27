require "spec_helper"

RSpec.describe IngRb::Transaction, active_session: true do
  it_behaves_like "list", "7de0041d-4f25-4b6c-a885-0bbeb1eab220"
end
