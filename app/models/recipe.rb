class Recipe < ApplicationRecord
  has_many :procedures, dependent: :destroy
  has_many :cooking_ingredients, dependent: :destroy
  belongs_to :room
  accepts_nested_attributes_for :procedures, allow_destroy: true
  accepts_nested_attributes_for :cooking_ingredients, allow_destroy: true
  belongs_to :user
  attr_accessor :public_post
  mount_uploader :image, ImageUploader

  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end