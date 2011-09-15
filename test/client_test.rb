require File.expand_path('../test_helper', __FILE__)

class ClientTest < Test::Unit::TestCase
  def test_creating_client_credentials
    client = BlueviaApi::Client.new(
      :access_token => 'access_token',
      :access_token_secret => 'secret'
    )

    assert_equal 'access_token', client.access_token
    assert_equal 'secret', client.access_token_secret
  end

  def test_sending_sms
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

    assert_equal 201, client.send_sms('00000000000', 'Hello, world!').code.to_i
  end
end
