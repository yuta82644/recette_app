class Room < ApplicationRecord
  has_many :room_assigns, dependent: :destroy
  has_many :users, through: :room_assigns
  has_many :recipes
  has_many :room_comments
  has_many :tasks, dependent: :destroy
   belongs_to :owner, class_name: 'User'
   validates :name, presence: true
   end