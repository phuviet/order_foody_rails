class CreateProductWatcheds < ActiveRecord::Migration[5.1]
  def change
    create_table :product_watcheds do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :product, index: true, foreign_key: true, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
