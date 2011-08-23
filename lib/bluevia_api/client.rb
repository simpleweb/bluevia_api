require 'oauth'
require 'log4r'

module BlueviaApi
  class Client
    include Sms

    attr_reader :access_token, :access_token_secret

    def initialize(options = {})
      @access_token = options[:access_token]
      @access_token_secret = options[:access_token_secret]
    end

    def logger
      @logger ||= Log4r::Logger.new 'bluevia api'
      @logger.outputters = Log4r::Outputter.stdout
    end

    # OAuth access token
    def token
      @_access_token ||= OAuth::AccessToken.new(consumer, @access_token, @access_token_secret)
    end

    private

    # Get an OAuth consumer instance.
    def consumer
      @consumer ||= OAuth::Consumer.new(BlueviaApi.token, BlueviaApi.secret, {
        :site => 'https://api.bluevia.com'
      })
    end
  end
end
