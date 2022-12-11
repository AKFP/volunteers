class AddColumnEducationSubjectCausesInVolunteers < ActiveRecord::Migration[7.0]
  def change
    add_column :volunteers, :education_level, :string
    add_column :volunteers, :subject_area, :string
    add_column :volunteers, :causes, :string
    add_column :volunteers, :about_yourself, :text
    add_column :volunteers, :facebook_link, :string
    add_column :volunteers, :twitter_link, :string
    add_column :volunteers, :linkedin_link, :string
    add_column :volunteers, :instagram_link, :string
    add_column :volunteers, :snapchat_link, :string
  end
end
