class ChangeColumnGenderToString < ActiveRecord::Migration[7.0]
  def change
    change_column :volunteers, :gender, :string
  end
end
