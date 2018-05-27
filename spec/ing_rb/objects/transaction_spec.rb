require "spec_helper"

RSpec.describe IngRb::Transaction, active_session: true do
  it_behaves_like "list"
end
