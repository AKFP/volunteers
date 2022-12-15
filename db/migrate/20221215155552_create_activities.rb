class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.text :about_organizer
      t.datetime :start_time
      t.datetime :end_time
      t.integer :points
      t.integer :skills, array: true, default: []
      t.integer :causes, array: true, default: []

      t.timestamps
    end
  end
end
