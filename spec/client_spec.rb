require 'helper'

describe BlueviaApi::Client do
  let(:client) do
    BlueviaApi.new(
      :access_token => 'token',
      :access_token_secret => 'secret'
    )
  end


  it "creates assigns the clients credentials" do
    client.access_token.should == 'token'
    client.access_token_secret.should == 'secret'
  end

  it "sends sms" do
    stub_request(:post, "https://api.bluevia.com/services/REST/SMS/outbound/requests?version=v1").
      with(:body => /smsText/, :headers => {
        'Accept' => '*/*',
        'Content-Length' => '113',
        'User-Agent' => 'OAuth gem v0.4.5'
      }).to_return(:status => 201)

    client.send_sms('00000000000', 'Hello, world!').code.to_i.should == 201
  end

  describe "receiving sms" do
    it "receives multiple sms" do
      stub_request(:get, "https://api.bluevia.com/services/REST/SMS/inbound/445480605/messages?version=v1&alt=json").
        to_return(:status => 200, :body => fixture('sms_polling_success.json'))

      received = client.receive_sms
      received.should_not be_empty
      received.length.should == 1
      received.first.message.should == "facejam This is a text message"
    end

    it "receives single sms" do
      stub_request(:get, "https://api.bluevia.com/services/REST/SMS/inbound/445480605/messages?version=v1&alt=json").
        to_return(:status => 200, :body => fixture('sms_polling_success_single.json'))

      received = client.receive_sms
      received.should_not be_empty
      received.length.should == 1
      received.first.message.should == "facejam This is a text message"
    end
  end

  describe "no sms to receive" do
     before do
      stub_request(:get, "https://api.bluevia.com/services/REST/SMS/inbound/445480605/messages?version=v1&alt=json").
        to_return(:status => 204)
    end

    it "doesn't receive sms" do
      received = client.receive_sms
      received.should be_empty
      received.length.should == 0
    end
  end

  describe "sandbox mode" do
    before do
      @stub = stub_request(:get, "https://api.bluevia.com/services/REST/SMS_Sandbox/inbound/445480605/messages?version=v1&alt=json").
        to_return(:status => 204)
    end

    after do
      BlueviaApi.sandbox = false
    end

    it "requests sandbox urls when in sandbox mode" do
      BlueviaApi.sandbox = true
      client.receive_sms
      @stub.should have_been_requested
    end
  end

  describe "subscribing to SMS" do
    before do
      @stub = stub_request(:post, "https://api.bluevia.com/services/REST/SMS/inbound/subscriptions?version=v1").
        to_return(:status => 201, :headers => { :location => "https://api.bluevia.com/services/REST/SMS/inbound/subscriptions/c7ke93abc4_2" })
    end

    it "can subscribe to notifications" do
      client.subscribe_to_sms(:correlator => "user:1", :endpoint => "https://example.com/messages")
      @stub.should have_been_requested
    end
  end
end
