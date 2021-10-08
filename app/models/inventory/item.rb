class Inventory::Item < ApplicationRecord
  include Prepper

  searchkick word_start: [:name]

  has_many :ingredients, :class_name => 'Cookbook::Ingredient', foreign_key: :inventory_item_id, dependent: :destroy

  before_validation :clean_name, :downcase_name

  validates :name, presence: true, uniqueness: true

end
