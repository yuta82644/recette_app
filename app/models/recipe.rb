class Recipe < ApplicationRecord
  has_many :procedures, dependent: :destroy
  has_many :cooking_ingredients, dependent: :destroy
  belongs_to :room
  accepts_nested_attributes_for :procedures, allow_destroy: true
  accepts_nested_attributes_for :cooking_ingredients, allow_destroy: true
  belongs_to :user
  attr_accessor :public_post
  mount_uploader :image, ImageUploader

  has_many :recipe_categories, dependent: :destroy
  has_many :categories, through: :recipe_categories
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy

  
   validates :title, presence: true, length: { maximum: 20 }
  # validates :room_id, presence: true, if: -> { room.present? }
  validates :title, presence: true, length: { maximum: 20 }
  validates :short_comment, presence: true
  validates :category_ids, presence: true
  validates :tortal_quantity, presence: true
  # タイトル検索 
  def self.ransackable_attributes(auth_object = nil)
    %w[title]
  end

  # カテゴリーの検索用スコープ
  def self.ransackable_associations(auth_object = nil)
    %w[categories]
  end

end
