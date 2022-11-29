class Admin::VolunteersController < AdminController
  before_action :authenticate_user!
  before_action :set_volunteer

  include VolunteersModule

  layout 'blank'

  def current_ability
    @current_ability ||= VolunteerAbility.new(current_user)
  end

  def index
    @q = Volunteer.ransack(params[:q])
    @volunteers = @q.result.page(params[:page])
    authorize! :manage, Volunteer, message: 'You are not authorized to access this page.'
  end

  def show
  end

  private
  def set_volunteer
    @volunteer = Volunteer.find_by(id: params[:id])
  end
end
