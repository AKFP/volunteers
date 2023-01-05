class Admin::VolunteersController < AdminController
  before_action :set_volunteer

  include VolunteersModule

  def current_ability
    @current_ability ||= VolunteerAbility.new(current_user)
  end

  def index
    @q                    = Volunteer.ransack(params[:q])
    @volunteers           = @q.result.registered.order("id DESC").page(params[:registered])
    @approved_volunteers  = @q.result.approved.order("id DESC").page(params[:approved])
    @rejected_volunteers  = @q.result.rejected.order("id DESC").page(params[:rejected])
    @ambassadors          = @q.result.where(id: User.with_role(:ambassador).pluck(:id)).order("id DESC").page(params[:ambassador])

    authorize! :manage, Volunteer, message: 'You are not authorized to access this page.'
  end

  def show
  end

  private
  def set_volunteer
    @volunteer = Volunteer.find_by(id: params[:id])
  end
end
