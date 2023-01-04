class Api::V1::CausesController < ApplicationController
	def index
		@causes = Cause.all
	end
end
