class Admin::DashboardController < AdminController
  def index
    @last_24_hours  = Volunteer.where("created_at >= ?", Date.today - 24.hours).size
    @last_week      = Volunteer.where("created_at >= ?", Date.today - 7.days).size
    @last_month     = Volunteer.where("created_at >= ?", Date.today - 1.month).size
  end
end
