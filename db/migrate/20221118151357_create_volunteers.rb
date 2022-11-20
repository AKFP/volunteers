class CreateVolunteers < ActiveRecord::Migration[7.0]
  def change
    create_table "volunteers", force: :cascade do |t|
      t.string "email"
      t.string "name"
      t.string "father_name"
      t.string "phone_whatsapp"
      t.string "cnic"
      t.date "dob"
      t.integer "age"
      t.string "gender"
      t.string "blood_group"
      t.string "city"
      t.string "current_address"
      t.string "hometown_address"
      t.string "educational_institute"
      t.string "degree_department"
      t.string "semester"
      t.string "professional_details", default: [], array: true
      t.string "skills", default: [], array: true
      t.string "area_of_interest", default: [], array: true
      t.string "availability", default: [], array: true
      t.string "availability_days", default: [], array: true
      t.string "marketing_medium", default: [], array: true
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "status", default: 0
      t.bigint "user_id"
      t.index ["user_id"], name: "index_volunteers_on_user_id", unique: true
    end
  end
end
