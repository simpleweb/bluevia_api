require "bluevia_api/version"

module BlueviaApi
  autoload :Client, 'bluevia_api/client'
  autoload :Sms, 'bluevia_api/sms'

  class << self
    attr_accessor :token, :secret, :sandbox
    attr_writer :keyword, :sandbox

    def keyword
      prefix = if @sandbox then "SAND"
               elsif @testing then "TEST"
               else ""
               end

      "#{prefix}#{@keyword}"
    end

    def sandbox
      @sandbox ||= false
    end

    def new(*args)
      Client.new(*args)
    end
  end
end
