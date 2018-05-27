require "coveralls"
Coveralls.wear!

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "ing_rb"

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.order = "random"

  config.before(:each, active_session: true) do
    IngRb.configure do |ingrb_config|
      ingrb_config.url = "https://api.sandbox.ing.com"
    end
  end
end
