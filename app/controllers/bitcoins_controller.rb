class BitcoinsController < ApplicationController

  def index
    @bitcoin = 1.0
    require "net/http"
    require "json"
    @url = "https://api.coindesk.com/v1/bpi/currentprice.json"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @bitcoin_data = JSON.parse(@response)
  
    # using Coindesk API, extract current rate of bitcoin in USD
    @usd_rate = @bitcoin_data["bpi"]["USD"]["rate_float"]
  
    # calculate value in USD of user's bitcoin
    @usd_value = @usd_rate * @bitcoin.to_f
  
  end
  
end