class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin


  private
  def authenticate_admin

  end
end