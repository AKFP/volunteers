class ChangeColumnCityInVolunteers < ActiveRecord::Migration[7.0]
  def change
    remove_column :volunteers, :city
    add_column :volunteers, :city_id, :integer
  end
end
