class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :context
      t.references :user, index: true, foreign_key: true, null: false
      t.references :product, index: true, foreign_key: true, null: false
      t.references :parent, index: true, foreign_key: { to_table: :comments}, null: true
      t.datetime :deleted_at

      t.timestamps null:true
    end
  end
end
