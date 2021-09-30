module Prepper
  extend ActiveSupport::Concern

  def clean_name
    self.name = self.name&.squish
  end

  def downcase_name
    self.name = self.name&.downcase
  end
end