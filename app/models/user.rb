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
  validates :name, presence: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guest"
      user.admin = false
    end
  end
  def self.guest_admin
    find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "admin_guest"
      user.admin = true
    end
  end
  private

  def create_default_room
    default_room = Room.create(name: "defaultRoom", owner: self)
    RoomAssign.create(user: self, room: default_room)
  end
end
