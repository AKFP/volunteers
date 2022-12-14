class Api::V1::VolunteersController < ApiController
  include ApiErrorHandling

  before_action :set_volunteer, only: [:show, :update]

  def index
    @volunteers = Volunteer.all
  end

  def show
    respond_with_error('not_found') unless @volunteer
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.user_id = current_user.id if current_user
    if @volunteer.save
    else
      respond_with_error('invalid_resource', @volunteer)
    end
  end

  def update
    @volunteer.update(volunteer_params)
  end

  private
  def volunteer_params
    params.require(:volunteer).permit(:email, :name, :father_name, :phone_whatsapp, :cnic, :dob, :age, :gender, :blood_group, :city,
                                      :current_address, :hometown_address, :educational_institute, :degree_department, :semester,
                                      :professional_details => [], :skills => [], :area_of_interest => [], :availability => [], :availability_days => [],
                                      :marketing_medium => [])
  end

  def set_volunteer
    @volunteer = Volunteer.find_by(id: params[:id])
  end
end