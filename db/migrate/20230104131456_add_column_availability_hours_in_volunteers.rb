class AddColumnAvailabilityHoursInVolunteers < ActiveRecord::Migration[7.0]
  def change
    add_column :volunteers, :availability_hours, :integer 
  end
end
