class CreateRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :regions do |t|
      t.string :name
      t.string :code
      t.string :short_code
      t.string :address

      t.timestamps
    end
  end
end
