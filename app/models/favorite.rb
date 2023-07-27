
class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

    def self.ransackable_attributes(auth_object = nil)
      %w[created_at id updated_at user_id recipe_title_cont]
    end

    def self.ransackable_associations(auth_object = nil)
      %w[recipe recipe_categories]
    end
  end

