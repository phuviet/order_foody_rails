class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :product, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.float :star
      t.text :description
      t.datetime :deleted_at

      t.timestamps null:true
    end
  end
end
