class Api::V1::ActivitiesController < ApiController
  include ApiErrorHandling

  def index
    @activities = Activity.all
  end

  def create
    @activity = Activity.new(activity_params)

    if @activity.save
    else
      respond_with_error('invalid_resource', @activity)
    end
  end

  private
  def activity_params
    params.require(:activity).permit(:title, :description, :about_organizer, :start_time, :end_time, :points, causes: [], :skills => [])
  end
end
