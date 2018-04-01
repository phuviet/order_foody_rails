class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :avatar
      t.text :description
      t.integer :star
      t.references :category, index: true, foreign_key: true, null: false
      t.datetime :deleted_at

      t.timestamps null:true
    end
  end
end
