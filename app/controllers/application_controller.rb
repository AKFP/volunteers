class ApplicationController < ActionController::Base
  layout Proc.new { |controller| controller.devise_controller? ? 'blank' : 'application' }


  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_path, alert: exception.message }
    end
  end

  def after_sign_in_path_for(resource)
    if resource.has_role?(:super_admin)
      admin_volunteers_path()
    else
      return volunteers_path()
    end
  end

  def after_sign_out_path_for(resource)
    return new_user_session_path
  end
end
