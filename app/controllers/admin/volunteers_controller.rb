class Admin::VolunteersController < AdminController
  before_action :authenticate_user!
  before_action :set_volunteer

  include VolunteersModule

  def current_ability
    @current_ability ||= VolunteerAbility.new(current_user)
  end

  def index
    @q = Volunteer.ransack(params[:q])
    @volunteers = @q.result.page(params[:page])
    @approved_volunteers = Volunteer.approved.page(params[:page_approved])
    @rejected_volunteers = Volunteer.rejected.page(params[:page_rejected])
    authorize! :manage, Volunteer, message: 'You are not authorized to access this page.'
  end

  def show
  end

  private
  def set_volunteer
    @volunteer = Volunteer.find_by(id: params[:id])
  end
end
