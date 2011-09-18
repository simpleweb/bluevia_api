require 'json'

module BlueviaApi
  module Sms
    def send_sms(number, message)
      token.post('/services/REST/SMS/outbound/requests?version=v1', {
        :smsText => {
          :address => { :phoneNumber => number },
          :message => message,
          :originAddress => { :alias => @access_token }
        }
      }.to_json, 'Content-Type' => 'application/json')
    end
  end
end
