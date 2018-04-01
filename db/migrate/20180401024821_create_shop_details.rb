class CreateShopDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_details do |t|
      t.string :key
      t.text :value
      t.datetime :deleted_at

      t.timestamps null:true
    end
  end
end
