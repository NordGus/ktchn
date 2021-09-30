class CreateInventoryItems < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_items do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :inventory_items, :name, unique: true
  end
end
