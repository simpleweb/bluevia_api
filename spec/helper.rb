$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'simplecov'
SimpleCov.start
require 'bluevia_api'
require 'rspec'
require 'webmock/rspec'

def fixture(name)
  File.read("spec/fixtures/#{name}")
end
