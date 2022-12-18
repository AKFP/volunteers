class Admin::ActivitiesController < AdminController
  before_action :set_activity, only: [:show, :edit, :update]

  include ActivitiesModule

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def show; end

  def edit; end

  def create
    @activity = Activity.new(activity_params)
    @activity.venues = [{latitude: params[:activity][:latitude], longitude: params[:activity][:longitude]}]

    respond_to do |format|
      if @activity.save
        format.html { redirect_to admin_activities_path(), notice: "Activity created successfully."  }
      else
        format.html { render :new, status: :unprocessable_entity }
      end

    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to admin_activity_path(@activity), notice: "Activity updated successfully."  }
      else
        format.html { render :new, status: :unprocessable_entity }
      end

    end
  end

  private
  def activity_params
    params.require(:activity).permit(:title, :description, :about_organizer, :job_description, :start_time, :end_time, :points, :header_image, pictures: [], causes: [], :skills => [])
  end

  def set_activity
    @activity = Activity.find_by(id: params[:id])
  end
end
