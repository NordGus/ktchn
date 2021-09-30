class CreateCookbookIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :cookbook_ingredients do |t|
      t.belongs_to :cookbook_recipe, null: false, foreign_key: true
      t.belongs_to :inventory_item, null: false, foreign_key: true
      t.belongs_to :inventory_unit, null: false, foreign_key: true
      t.decimal :amount, null: false, default: 0.0, precision: 15, scale: 3

      t.timestamps
    end
  end
end
