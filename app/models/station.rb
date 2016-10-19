class Station
  attr_reader :type, :name, :distance, :access_time

  def self.nearest_stations(num:, location:)
    conn = Faraday.new(url: "https://developer.nrel.gov")
    endpoint = '/api/alt-fuel-stations/v1/nearest.json'
    get_params = {api_key: ENV['nrel_api_key'], location: location, format: "JSON"}
    res = conn.get('/api/alt-fuel-stations/v1/nearest.json', get_params )
    raw_stations = JSON.parse(res.body, symbolize_names: true)[:fuel_stations]

    # raw_stations = NRELService.nearest_stations(location)
    stations = raw_stations.map { |station| new(station) }
    stations.first(num)
  end

  def initialize(params)
    @access_time = params[:access_days_time]
    @type        = params[:fuel_type_code]
    @name        = params[:station_name]
    @city        = params[:city]
    @state       = params[:state]
    @street_address = params[:street_address]
    @zipcode     = params[:zip]
    @distance    = params[:distance]
  end

  def address
    "#{@street_address}\n#{@city}, #{@state} #{@zipcode}"
  end
end
