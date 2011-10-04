require "bluevia_api/version"

module BlueviaApi
  autoload :Client, 'bluevia_api/client'
  autoload :Sms, 'bluevia_api/sms'

  class << self
    attr_accessor :token, :secret, :sandbox
    attr_writer :keyword

    def keyword
      "#{"SAND" if @sandbox}#{@keyword}"
    end

    def new(*args)
      Client.new(*args)
    end
  end
end
