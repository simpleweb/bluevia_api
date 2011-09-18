require 'helper'

describe BlueviaApi do
  before do
    BlueviaApi.token = nil
    BlueviaApi.secret = nil
  end

  it "set the token and secret" do
    BlueviaApi.token = 'consumer_token'
    BlueviaApi.secret = 'consumer_secret'

    BlueviaApi.token.should == 'consumer_token'
    BlueviaApi.secret.should == 'consumer_secret'
  end
end
