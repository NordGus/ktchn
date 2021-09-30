class Inventory::Item < ApplicationRecord
  include Prepper

  before_validation :clean_name, :downcase_name

  validates :name, presence: true, uniqueness: true

  has_many :ingredients, :class_name => 'Cookbook::Ingredient', foreign_key: :inventory_item_id
end
