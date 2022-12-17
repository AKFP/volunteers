class Admin::ActivitiesController < AdminController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        # @activity.skills = Skill.where(id: params[:volunteer][:skills_attributes]["0"]["name"])

        format.html { redirect_to admin_activities_path(), notice: "Activity created successfully."  }
      else
        format.html { render :new, status: :unprocessable_entity }
      end

    end
  end

  private
  def activity_params
    params.require(:activity).permit(:title, :description, :about_organizer, :start_time, :end_time, :points, causes: [], :skills => [])
  end
end
