class Cookbook::Ingredient < ApplicationRecord
  belongs_to :recipe, :class_name => 'Cookbook::Recipe', foreign_key: :cookbook_recipe_id
  belongs_to :item, :class_name => 'Inventory::Item', foreign_key: :inventory_item_id
  belongs_to :unit, :class_name => 'Inventory::Unit', foreign_key: :inventory_unit_id

  validates :amount,
            presence: true,
            numericality: { greater_than: 0, less_than: BigDecimal(10**12) }

  scope :cookbook_collection, -> { includes(:recipe, :item, :unit) }

  after_create_commit { broadcast_append_to :ingredients, target: :ingredients }
  after_update_commit { broadcast_replace_to :ingredients }
  after_destroy_commit { broadcast_remove_to :ingredients }

  accepts_nested_attributes_for :item, allow_destroy: false
end
