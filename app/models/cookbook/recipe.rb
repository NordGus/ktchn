class Cookbook::Recipe < ApplicationRecord
  include Prepper

  has_many :ingredients, :class_name => 'Cookbook::Ingredient', foreign_key: :cookbook_recipe_id, dependent: :destroy

  before_validation :clean_name

  validates :name,
            presence: true,
            uniqueness: true

  validates :description,
            length: { maximum: 200 }

  validates :portions,
            presence: true,
            numericality: { greater_than_or_equal_to: 1 }

  after_create_commit { v :cookbook_recipes, locals: { is_active: true } }
  after_update_commit { broadcast_replace_to :cookbook_recipes }
  after_destroy_commit { broadcast_remove_to :cookbook_recipes }
end
