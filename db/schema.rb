# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_29_163210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cookbook_ingredients", force: :cascade do |t|
    t.bigint "cookbook_recipe_id", null: false
    t.bigint "inventory_item_id", null: false
    t.bigint "inventory_unit_id", null: false
    t.decimal "amount", precision: 15, scale: 3, default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cookbook_recipe_id"], name: "index_cookbook_ingredients_on_cookbook_recipe_id"
    t.index ["inventory_item_id"], name: "index_cookbook_ingredients_on_inventory_item_id"
    t.index ["inventory_unit_id"], name: "index_cookbook_ingredients_on_inventory_unit_id"
  end

  create_table "cookbook_recipes", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.text "preparation"
    t.integer "portions", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_cookbook_recipes_on_name", unique: true
  end

  create_table "inventory_items", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_inventory_items_on_name", unique: true
  end

  create_table "inventory_units", force: :cascade do |t|
    t.string "name", null: false
    t.integer "category", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "category"], name: "index_inventory_units_on_name_and_category", unique: true
  end

  add_foreign_key "cookbook_ingredients", "cookbook_recipes"
  add_foreign_key "cookbook_ingredients", "inventory_items"
  add_foreign_key "cookbook_ingredients", "inventory_units"
end
