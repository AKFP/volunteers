class Admin::InstitutesController < AdminController
  # before_action :set_volunteer

  def index
    @institutes = Institute.all
  end

  def new
    @institute = Institute.new
  end

  def create
    @institute = Institute.new(institute_params)

    respond_to do |format|
      if @institute.save
        format.html { redirect_to admin_institutes_url(), notice: "Institute created successfully." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end

    end
  end


  private
  def institute_params
    params.require(:institute).permit(:name, :city_id, :address)
  end
end