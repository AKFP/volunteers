class Admin::ActivitiesController < AdminController
  def index
    @activities = Activity.all
  end
end
