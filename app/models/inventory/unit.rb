class Inventory::Unit < ApplicationRecord
  include Prepper

  has_many :ingredients, :class_name => 'Cookbook::Ingredient', foreign_key: :inventory_unit_id, dependent: :destroy

  before_validation :clean_name, :downcase_name

  validates :name, presence: true, uniqueness: { scope: [:category] }

  enum category: {
    count: 0,
    mass: 1,
    volume: 2,
    length: 3,
    surface: 4,
  }, _suffix: :category
end
