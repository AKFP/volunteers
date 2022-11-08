class VolunteersController < ApplicationController
  def index
    @application = Doorkeeper::Application.where(name: 'web client').first

    @application = {
      name: @application.name,
      client_id: @application.uid,
      client_secret: @application.secret
    }
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(params_volunteer)
    respond_to do |format|
      if @volunteer.save
        format.turbo_stream { redirect_to thank_you_volunteers_path()  }
      else
        format.html { render :new, status: :unprocessable_entity }
      end

    end
  end

  def thank_you

  end

  private
  def params_volunteer
    params.require(:volunteer).permit(:email, :name, :father_name, :phone_whatsapp, :cnic, :dob, :age, :gender, :blood_group, :city,
                                      :current_address, :hometown_address, :educational_institute, :degree_department, :semester,
                                      :professional_details => [], :skills => [], :area_of_interest => [], :availability => [], :availability_days => [],
                                      :marketing_medium => [])
  end
end
