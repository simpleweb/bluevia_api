require 'json'

module BlueviaApi
  module Sms
    def send_sms(number, message)
      token.post("/services/REST/SMS#{"_Sandbox" if BlueviaApi.sandbox}/outbound/requests?version=v1", {
        :smsText => {
          :address => { :phoneNumber => number },
          :message => message,
          :originAddress => { :alias => @access_token }
        }
      }.to_json, 'Content-Type' => 'application/json')
    end

    def receive_sms
      response = token.get("/services/REST/SMS#{"_Sandbox" if BlueviaApi.sandbox}/inbound/445480605/messages?alt=json&version=v1")

      case response.code.to_i
      when 200
        parse_messages(response.body)
      when 204
        []
      end
    end

    def subscribe_to_sms(options = {})
      token.post("/services/REST/SMS#{"_Sandbox" if BlueviaApi.sandbox}/inbound/subscriptions?version=v1", {
        :smsNotification => {
          :reference => {
            :correlator => options[:correlator],
            :endpoint => options[:endpoint]
          },
          :destinationAddress => {
            :phoneNumber => "445480605"
          },
          :criteria => "facejam"
        }
      })
    end

    private

    def parse_messages(json_body)
      body = JSON.parse(json_body)['receivedSMS']['receivedSMS']
      if body.kind_of?(Array)
        body.map do |msg|
          ReceivedSMS.new(msg)
        end
      else
        [ReceivedSMS.new(body)]
      end
    end

    class ReceivedSMS
      attr_reader :message, :origin_address, :destination_address, :date_time

      def initialize(options)
        @message = options['message']
        @origin_address = options['originAddress']['phoneNumber']
        @destination_address = options['destinationAddress']['phoneNumber']
        @date_time = Time.new(options['dateTime'])
      end
    end
  end
end
