class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.datetime :deleted_at

      t.timestamps null:true
    end
  end
end
