class Api::V1::VolunteersController < ApiController
  include ApiErrorHandling

  skip_before_action :doorkeeper_authorize!, only: [:verify_email]

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
      current_user.add_role(:volunteer) if current_user
      @volunteer.set_skills params[:skills]
    else
      respond_with_error('invalid_resource', @volunteer)
    end
  end

  def update
    if @volunteer
      @volunteer.update(volunteer_params)
      
      @volunteer.set_skills params[:skills]
    else
      respond_with_error('invalid_resource', @volunteer)
    end
  end

  def verify_email
    return if params[:activation_code].blank?

    @user = User.where(activation_code: params[:activation_code], email: params[:email]).last
    @user.update(is_email_verified: true, activation_code: nil) if @user
  end

  private
  def volunteer_params
    params.require(:volunteer).permit(:email, :name, :father_name, :phone_whatsapp, :cnic, :dob, :age, :gender, :blood_group,
                                      :city_id, :picture_url, :current_address, :hometown_address, :educational_institute,
                                      :degree_department, :semester, :education_level, :subject_area, :availability_hours, #:education_status,
                                      :about_yourself, :facebook_link, :twitter_link, :linkedin_link, :instagram_link, :snapchat_link,
                                      :causes => [], :professional_details => [], :skills => [], :area_of_interest => [],
                                      :availability => [], :availability_days => [], :marketing_medium => [])
  end

  def set_volunteer
    @volunteer = Volunteer.find_by(id: params[:id])
  end
end