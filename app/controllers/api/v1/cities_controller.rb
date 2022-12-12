class Api::V1::CitiesController < ApiController
  def index
    @cities = City.all
  end
end
