class AddColumnVenuesInActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :venues, :jsonb, null: false, default: {}
  end
end
