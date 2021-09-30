class CreateInventoryUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_units do |t|
      t.string :name, null: false
      t.integer :category, null: false, default: 0

      t.timestamps
    end

    add_index :inventory_units, [:name, :category], unique: true
  end
end
