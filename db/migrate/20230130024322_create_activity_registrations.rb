class CreateActivityRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_registrations do |t|
      t.references :activity
      t.references :volunteer
      t.integer :status
      t.timestamps
    end
  end
end
