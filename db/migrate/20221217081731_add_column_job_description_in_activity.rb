class AddColumnJobDescriptionInActivity < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :job_description, :text
  end
end
