class Admin::VolunteersController < ApplicationController
  before_action :authenticate_user!

  def index
    @volunteers = Volunteer.all.page(params[:page])
  end
end
