class Api::V1::SkillsController < ApiController
	include ApiErrorHandling
  
  skip_before_action :doorkeeper_authorize!, only: [:index]

	def index
    @skills = Skill.all
  end
end
