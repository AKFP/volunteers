class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    return volunteers_path
  end

  def after_sign_out_path_for(resource)
    return new_user_session_path
  end
end
