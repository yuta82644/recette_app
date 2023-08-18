FactoryBot.define do
  factory :room_comment do
    association :user
    association :room
    content { "テストコメント" }
  end
end