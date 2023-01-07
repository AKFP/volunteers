class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.has_any_role?(:super_admin, :admin)
      return admin_volunteers_path()
    else
      return root_path()
    end
  end

  def authenticate_admin

  end
end
