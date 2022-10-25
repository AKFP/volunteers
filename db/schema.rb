# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_25_191603) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "volunteers", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "father_name"
    t.string "phone_whatsapp"
    t.string "cnic"
    t.date "dob"
    t.integer "gender"
    t.string "blood_group"
    t.string "city"
    t.string "current_address"
    t.string "hometown_address"
    t.string "educational_institute"
    t.string "degree_department"
    t.string "semester"
    t.string "professional_details", default: [], array: true
    t.string "skills", default: [], array: true
    t.string "area_of_interest"
    t.string "availability", default: [], array: true
    t.string "availability_days", default: [], array: true
    t.string "how_you_know", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
