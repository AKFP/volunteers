class Api::V1::CausesController < ApiController
	include ApiErrorHandling
  
	skip_before_action :doorkeeper_authorize!, only: [:index]

	def index
		@causes = Cause.all
	end
end
