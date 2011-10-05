require "bluevia_api/version"

module BlueviaApi
  autoload :Client, 'bluevia_api/client'
  autoload :Configuration, 'bluevia_api/configuration'
  autoload :Sms, 'bluevia_api/sms'

  extend Configuration

  def self.new(*args)
    Client.new(*args)
  end
end
