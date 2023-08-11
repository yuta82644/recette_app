class Task < ApplicationRecord
  belongs_to :room
 validate :custom_validation

  def custom_validation
    errors.add(:title, "タイトルを入力してください") if title.blank?
  end
end
