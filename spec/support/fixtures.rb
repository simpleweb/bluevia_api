module Fixtures
  def fixture(name)
    File.open("spec/fixtures/#{name}")
  end
end

RSpec.configuration.include Fixtures
