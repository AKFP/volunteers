class Api::V1::StaticDataController < ApiController
  include ApiErrorHandling

  def index
    @data = YAML.load_file( 'lib/data/data.yml' )
  end
end
