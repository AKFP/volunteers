class VolunteersController < ApplicationController
  def index

  end

  def new
    @volunteer = Volunteer.new
  end
end
