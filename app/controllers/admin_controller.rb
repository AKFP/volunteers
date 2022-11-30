class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  layout 'blank'

  private
  def authorize_admin
    redirect_to root_path, flash: { danger: "Sorry! you are not authorize to access this page." } unless current_user.has_role?(:super_admin)
  end
end