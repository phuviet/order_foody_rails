class CreateProductsImages < ActiveRecord::Migration[5.1]
  def change
    create_table :products_images do |t|
      t.text :image
      t.references :product, index: true, foreign_key: true, null: false
      t.datetime :deleted_at

      t.timestamps null:true
    end
  end
end
