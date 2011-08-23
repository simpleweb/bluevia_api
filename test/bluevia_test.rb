require File.expand_path('../test_helper', __FILE__)

class BlueviaApiTest < Test::Unit::TestCase
  def setup
    BlueviaApi.token = nil
    BlueviaApi.secret = nil
  end

  def test_setting_bluevia_consumer_details
    BlueviaApi.token = 'consumer_token'
    BlueviaApi.secret = 'consumer_secret'

    assert_equal 'consumer_token', BlueviaApi.token
    assert_equal 'consumer_secret', BlueviaApi.secret
  end
end
