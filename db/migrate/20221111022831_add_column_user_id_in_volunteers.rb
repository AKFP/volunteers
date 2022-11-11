class AddColumnUserIdInVolunteers < ActiveRecord::Migration[7.0]
  def change
    add_column :volunteers, :user_id, :bigint, null: true

    add_index :volunteers, :user_id, unique: true
  end
end
