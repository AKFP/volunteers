class VolunteersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :thank_you]
  layout 'public'

  def index
    @application = Doorkeeper::Application.where(name: 'web client').first

    @application = {
      name: @application.name,
      client_id: @application.uid,
      client_secret: @application.secret
    }
  end

  def new
    @skill = Skill.new
    @volunteer = Volunteer.new
    @volunteer.build_user
  end

  def create
    @volunteer = Volunteer.new(params_volunteer)
    @volunteer.build_user(email: params_volunteer[:email], password: (0...8).map { ('a'..'z').to_a[rand(26)] }.join)

    respond_to do |format|
      if @volunteer.user.valid? && @volunteer.save
        @volunteer.user.add_role(:volunteer)
        @volunteer.skills = Skill.where(id: params[:volunteer][:skills_attributes]["0"]["name"]) if !params[:volunteer][:skills_attributes].nil?

        UserMailer.welcome_email(@volunteer.user).deliver_later

        format.html { redirect_to thank_you_volunteers_path()  }
      else
        format.html { render :new, status: :unprocessable_entity, notice: "Volunteer could not be registered." }
      end

    end
  end

  def thank_you

  end

  private
  def params_volunteer
    params.require(:volunteer).permit(:email, :name, :father_name, :phone_whatsapp, :cnic, :dob, :age, :gender, :blood_group, :city_id,
                                      :current_address, :hometown_address, :educational_institute, :degree_department, :semester, :profile_pic,
                                      :education_level, :subject_area, :about_yourself, :facebook_link, :twitter_link, :linkedin_link, :instagram_link, :snapchat_link,
                                      :professional_details => [], :area_of_interest => [], :availability => [], :availability_days => [],
                                      :marketing_medium => [], :causes => [])
  end
end
