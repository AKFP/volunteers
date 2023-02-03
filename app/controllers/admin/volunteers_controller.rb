class Admin::VolunteersController < AdminController
  before_action :set_volunteer

  include VolunteersModule

  def current_ability
    @current_ability ||= VolunteerAbility.new(current_user)
  end

  def index
    # binding.pry
    # params[:q]["causes"] = [] if params[:q]["causes"].nil? if params[:q]
    # params[:q]["causes"] = params[:q]["causes"].map(&:to_i) if params[:q]

    @q                    = Volunteer.ransack(params[:q])
    @search               = @q.result
    # @search               = @q.result.by_causes(params[:q]["causes"]) if params[:q]
    @search               = @q.result.filter_by_region_id(current_user.region_id) if current_user.has_role?(:admin)

    @volunteers           = @search.registered.page(params[:registered])
    @approved_volunteers  = @search.approved.page(params[:approved])
    @rejected_volunteers  = @search.rejected.page(params[:rejected])
    @ambassadors          = @search.where(id: User.with_role(:ambassador).pluck(:id)).page(params[:ambassador])

    authorize! :manage, Volunteer, message: 'You are not authorized to access this page.'
  end

  def show
  end

  def edit
  end
  
  def update
    if @volunteer
      @volunteer.update(volunteer_params)      
      @volunteer.set_skills params[:skills]
    else
      respond_with_error('invalid_resource', @volunteer)
    end

    redirect_back(fallback_location: admin_volunteer_path(@volunteer))
  end

  private
  def set_volunteer
    @volunteer = Volunteer.find_by(id: params[:id])
  end

  def volunteer_params
    params.require(:volunteer).permit(:email, :name, :father_name, :phone_whatsapp, :cnic, :dob, :age, :gender, :blood_group,
                                      :city_id, :picture_url, :current_address, :hometown_address, :educational_institute,
                                      :degree_department, :semester, :education_level, :subject_area, :availability_hours, # :status, #:education_status,
                                      :about_yourself, :facebook_link, :twitter_link, :linkedin_link, :instagram_link, :snapchat_link,
                                      :causes => [], :professional_details => [], :skills => [], :area_of_interest => [],
                                      :availability => [], :availability_days => [], :marketing_medium => [])
  end
end
