class CreatePasswordResetTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :password_reset_tokens do |t|
      t.string :token
      t.integer :user_id
      t.datetime :expires_at

      t.timestamps
    end
  end
end
