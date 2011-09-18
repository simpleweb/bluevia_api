require 'helper'

describe BlueviaApi::Client do
  it "creates assigns the clients credentials" do
    client = BlueviaApi::Client.new(
      :access_token => 'access_token',
      :access_token_secret => 'secret'
    )

    client.access_token.should == 'access_token'
    client.access_token_secret.should == 'secret'
  end

  it "sends sms" do
    stub_request(:post, "https://api.bluevia.com/services/REST/SMS/outbound/requests?version=v1").
      with(:body => /smsText/, :headers => {
        'Accept' => '*/*',
        'Content-Length' => '113',
        'User-Agent' => 'OAuth gem v0.4.5'
      }).to_return(:status => 201)

    client = BlueviaApi.new(
      :access_token => 'token',
      :access_token_secret => 'secret'
    )

    client.send_sms('00000000000', 'Hello, world!').code.to_i.should == 201
  end
end
