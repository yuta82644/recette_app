FactoryBot.define do
  factory :cooking_ingredient do
    recipe
    ingredient_name { "テスト材料1" }
  end
end