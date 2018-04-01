class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.integer :middle_name
      t.string :phone
      t.text :address
      t.integer :gender
      t.date :birthday
      t.text :avatar
      t.string :auth_token
      t.datetime :confirm_send_at
      t.string :confirm_token
      t.datetime :confirm_at
      t.datetime :reset_send_at
      t.string :reset_token
      t.datetime :deleted_at
      t.references :role, index: true, foreign_key: true, null: true

      t.timestamps null:true
    end
  end
end
