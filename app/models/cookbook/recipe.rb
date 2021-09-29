class Cookbook::Recipe < ApplicationRecord
  before_validation :clean_name

  validates :name, presence: true, uniqueness: true

  after_create_commit { broadcast_append_to :cookbook_recipes }
  after_update_commit { broadcast_replace_to :cookbook_recipes }
  after_destroy_commit { broadcast_remove_to :cookbook_recipes }

  private

  def clean_name
    self.name = self.name&.strip
  end
end
