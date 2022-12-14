class AddColumnCausesInVolunteers < ActiveRecord::Migration[7.0]
  def change
    remove_column :volunteers, :causes
    add_column :volunteers, :causes, :integer, array: true, default: []
  end
end
