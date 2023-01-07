class AddColumnRegionIdInUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :region_id, :integer
  end
end
