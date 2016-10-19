class NRELService
  def self.nearest_stations(location)
    conn = Faraday.new(url: "https://developer.nrel.gov")
    endpoint = '/api/alt-fuel-stations/v1/nearest.json'
    get_params = {api_key: ENV['nrel_api_key'], location: location, format: "JSON"}
    res = conn.get('/api/alt-fuel-stations/v1/nearest.json', get_params )
    JSON.parse(res.body, symbolize_names: true)[:fuel_stations]
  end
end
