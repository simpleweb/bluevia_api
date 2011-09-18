$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'bluevia_api'
require 'webmock/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir["#{File.expand_path(__FILE__)}/support/**/*.rb"].each {|f| puts f;require f}
