class CreateSystemConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :system_configs do |t|
      t.string :name
      t.text :value
      t.string :data_type
    end
  end
end
