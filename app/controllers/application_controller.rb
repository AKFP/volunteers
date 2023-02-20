class ApplicationController < ActionController::Base
  before_action :set_xframe_actions

  def after_sign_in_path_for(resource)
    if resource.has_any_role?(:super_admin, :admin)
      return admin_volunteers_path()
    else
      return root_path()
    end
  end

  def authenticate_admin

  end

  def set_xframe_actions
    response.headers['X-Frame-Options'] = 'ALLOW-FROM https://alkhidmat.org/volunteers/volunteers.html'
  end
end
