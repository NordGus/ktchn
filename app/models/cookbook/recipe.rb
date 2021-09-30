class Cookbook::Recipe < ApplicationRecord
  include Prepper

  before_validation :clean_name

  validates :name,
            presence: true,
            uniqueness: true

  validates :portions,
            presence: true,
            numericality: { greater_than_or_equal_to: 1 }

  after_create_commit { broadcast_append_to :cookbook_recipes }
  after_update_commit { broadcast_replace_to :cookbook_recipes }
  after_destroy_commit { broadcast_remove_to :cookbook_recipes }

  has_many :ingredients, :class_name => 'Cookbook::Ingredient', foreign_key: :cookbook_recipe_id
end
