class Admin::CitiesController < AdminController
  def index
    @cities = City.all
  end
end
