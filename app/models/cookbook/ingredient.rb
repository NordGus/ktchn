class Cookbook::Ingredient < ApplicationRecord
  belongs_to :recipe, :class_name => 'Cookbook::Recipe', dependent: :destroy, foreign_key: :cookbook_recipe_id
  belongs_to :item, :class_name => 'Inventory::Item', dependent: :destroy, foreign_key: :inventory_item_id
  belongs_to :unit, :class_name => 'Inventory::Unit', dependent: :destroy, foreign_key: :inventory_unit_id

  validates :amount,
            presence: true,
            numericality: { greater_than: 0, less_than: BigDecimal(10**12) }

  scope :cookbook_collection, -> { includes(:recipe, :item, :unit) }
end
