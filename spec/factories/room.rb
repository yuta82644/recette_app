FactoryBot.define do
  factory :room do
    name { "roomtest"}
    owner_id { FactoryBot.create(:second_user)}
  end
end
