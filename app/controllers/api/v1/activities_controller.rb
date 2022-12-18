class Api::V1::ActivitiesController < ApiController
  include ApiErrorHandling

  before_action :set_activity, only: [:show]

  def index
    @activities = Activity.all
  end

  def show; end

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

  def set_activity
    @activity = Activity.find_by(id: params[:id])
  end
end
