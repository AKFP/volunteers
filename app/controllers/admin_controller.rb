class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  layout 'blank'

  private
  def authenticate_admin

  end
end