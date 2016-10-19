class SearchController < ApplicationController
  def index
    ### API CALL
    conn = Faraday.new(url: "https://developer.nrel.gov")
    endpoint = '/api/alt-fuel-stations/v1/nearest.json'
    get_params = {api_key: ENV['nrel_api_key'], location: 80203, format: "JSON"}


    res = conn.get('/api/alt-fuel-stations/v1/nearest.json', get_params )
    byebug


    ### OBJECT



  end
end
