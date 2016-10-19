class SearchController < ApplicationController
  def index
    ### API CALL
    conn = Faraday.new(url: "https://developer.nrel.gov")
    endpoint = '/api/alt-fuel-stations/v1/nearest.json'
    get_params = {api_key: ENV['nrel_api_key'], location: 80203, format: "JSON"}


    res = conn.get('/api/alt-fuel-stations/v1/nearest.json', get_params )

    raw_stations = JSON.parse(res.body, symbolize_names: true)[:fuel_stations]
    ### OBJECT
    @stations = raw_stations.map { |station| Station.new(station) }



  end
end
