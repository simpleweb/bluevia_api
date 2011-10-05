require "bluevia_api/version"

module BlueviaApi
  autoload :Client, 'bluevia_api/client'
  autoload :Configuration, 'bluevia_api/configuration'
  autoload :Sms, 'bluevia_api/sms'

  extend Configuration

  # Public: Delegate to BlueviaApi::Client for creating a new instance.
  #
  # Returns an Instance of BlueviaApi::Client
  def self.new(*args)
    Client.new(*args)
  end
end
