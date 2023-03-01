class Api::V1::StaticDataController < ApiController
	include ApiErrorHandling
  
  skip_before_action :doorkeeper_authorize!, only: [:index]

  def index
    @data = YAML.load_file( 'lib/data/data.yml' )
    @skills = Skill.all.order(:name)
    @causes = Cause.all.order(:name)
    @cities = City.all.order(:name)
  end
end
