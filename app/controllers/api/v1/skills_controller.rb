class Api::V1::SkillsController < ApplicationController
	def index
    @skills = Skill.all
  end
end
