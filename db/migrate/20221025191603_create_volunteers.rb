class CreateVolunteers < ActiveRecord::Migration[7.0]
  def change
    create_table :volunteers do |t|
      t.string :email
      t.string :name
      t.string :father_name
      t.string :phone_whatsapp
      t.string :cnic
      t.date :dob
      t.integer :age
      t.integer :gender
      t.string :blood_group
      t.string :city
      t.string :current_address
      t.string :hometown_address
      t.string :educational_institute
      t.string :degree_department
      t.string :semester
      t.string :professional_details, array: true, default: []
      t.string :skills, array: true, default: []
      t.string :area_of_interest
      t.string :availability, array: true, default: []
      t.string :availability_days, array: true, default: []
      t.string :how_you_know, array: true, default: []

      t.timestamps
    end
  end
end
