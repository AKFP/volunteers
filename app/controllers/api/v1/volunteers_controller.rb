class Api::V1::VolunteersController < ApiController
  def index
    @volunteers = Volunteer.all

    render json: @volunteers
  end
end