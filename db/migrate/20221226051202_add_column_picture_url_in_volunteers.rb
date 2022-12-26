class AddColumnPictureUrlInVolunteers < ActiveRecord::Migration[7.0]
  def change
    add_column :volunteers, :picture_url, :string
  end
end
