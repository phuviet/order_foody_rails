class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :receiver
      t.text :address
      t.string :phone
      t.integer :status
      t.references :user, index: true, foreign_key: true, null: false
      t.datetime :deleted_at

      t.timestamps null:true
    end
  end
end
