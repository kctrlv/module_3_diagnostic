class Station
  attr_reader :type, :name, :distance
  
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
