class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :rememberable, :validatable
  mount_uploader :image, ImageUploader
  has_many :room_assigns, dependent: :destroy
  has_many :rooms, through: :room_assigns, source: :room
  has_many :recipes
  has_many :favorites, dependent: :destroy
  has_many :room_comments
  after_create :create_default_room
  
  private

  def create_default_room
    default_room = Room.create(name: "デフォルトのルーム", introduction: "デフォルトのルーム")
    self.room_assigns.create(room: default_room)
  end
end
