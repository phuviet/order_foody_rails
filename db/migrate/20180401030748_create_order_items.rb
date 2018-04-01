class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.float :total_price
      t.integer :quantity
      t.references :order, index: true, foreign_key: true, null: false
      t.references :product, index: true, foreign_key: true, null: false
      t.datetime :deleted_at

      t.timestamps null:true
    end
  end
end
