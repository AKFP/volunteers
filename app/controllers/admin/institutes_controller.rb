class Admin::InstitutesController < AdminController
  before_action :set_institute, only: [:edit, :show, :update]

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

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @institute.update(institute_params)
        format.html { redirect_to admin_institute_url(@institute), notice: "Institute was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private
  def institute_params
    params.require(:institute).permit(:name, :city_id, :address)
  end

  def set_institute
    @institute = Institute.find_by(id: params[:id])
  end
end