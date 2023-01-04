class Api::V1::StaticDataController < ApiController
	include ApiErrorHandling
  
  skip_before_action :doorkeeper_authorize!, only: [:index]

  def index
    @data = YAML.load_file( 'lib/data/data.yml' )
  end
end
