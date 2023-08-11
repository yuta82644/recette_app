class Category < ApplicationRecord
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories
  validates :name, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false, message: "はすでに存在しています" }

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
   
end
