class CreateInstitutes < ActiveRecord::Migration[7.0]
  def change
    create_table :institutes do |t|
      t.string :name
      t.integer :city_id
      t.string :address
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps
    end
  end
end
