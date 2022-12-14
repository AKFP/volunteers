class RemoveColumnSkillsFromVolunteers < ActiveRecord::Migration[7.0]
  def change
    remove_column :volunteers, :skills
  end
end
