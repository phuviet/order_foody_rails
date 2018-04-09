class CreateApiKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :api_keys do |t|
      t.string :access_token, null: false
      t.integer :user_id, index: true, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :api_keys, [:access_token, :user_id], unique: true, where: 'deleted_at IS NULL'
  end
end
