class Category < ApplicationRecord
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories
  
   def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
