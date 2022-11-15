class Admin::VolunteersController < ApplicationController
  before_action :authenticate_user!

  def current_ability
    @current_ability ||= VolunteerAbility.new(current_user)
  end

  def index
    @volunteers = Volunteer.all.page(params[:page])
    authorize! :manage, Volunteer
  end
end
