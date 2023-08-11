class CookingIngredient < ApplicationRecord
  belongs_to :recipe
   validates :ingredient_name, presence: true, length: { maximum: 20 }
  validates :quantity, presence: true
  validates :unit, presence: true
end 