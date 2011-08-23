require "bluevia_api/version"

module BlueviaApi
  autoload :Client, 'bluevia_api/client'
  autoload :Sms, 'bluevia_api/sms'

  class << self
    attr_accessor :token, :secret

    def new(*args)
      Client.new(*args)
    end
  end
end
