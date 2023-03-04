class Admin::DashboardController < AdminController
  def index
    @regions = Region.all
    selected_cities = [56,66,88,90,29]
    @cities_count = {}
    @volunteers_by_city = Volunteer.where(city_id: selected_cities)
    @last_24_hours  = Volunteer.where("created_at >= ?", Date.today - 24.hours).size
    @last_week      = Volunteer.where("created_at >= ?", Date.today - 7.days).size
    @last_month     = Volunteer.where("created_at >= ?", Date.today - 1.month).size

    selected_cities.each do |c|
      volunteers = @volunteers_by_city.select{|v| v.city_id == c}
      @cities_count[volunteers.first.city.name.downcase.to_sym] = volunteers.size
    end

  end
end
