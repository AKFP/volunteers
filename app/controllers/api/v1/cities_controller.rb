class Api::V1::CitiesController < ApiController
	include ApiErrorHandling
  
  skip_before_action :doorkeeper_authorize!, only: [:index]

  def index
    @cities = City.all
  end
end
