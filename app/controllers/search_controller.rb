class SearchController < ApplicationController
  def index
    @stations = Station.nearest_stations(num: 10, location: params['q'])
  end
end
