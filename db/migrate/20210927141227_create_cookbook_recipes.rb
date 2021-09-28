class CreateCookbookRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :cookbook_recipes do |t|
      t.string :name
      t.string :description
      t.text :preparion

      t.timestamps
    end
  end
end
