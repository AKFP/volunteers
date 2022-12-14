class CreateSkillVolunteers < ActiveRecord::Migration[7.0]
  def change
    create_table :skill_volunteers do |t|
      t.integer :volunteer_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
