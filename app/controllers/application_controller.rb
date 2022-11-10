class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    return volunteers_path
  end
end
