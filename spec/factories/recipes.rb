FactoryBot.define do
  factory :recipe do
    association :user
    title { "テストレシピ" }
    tortal_quantity { "2人分" }
    short_comment { "美味しいレシピです" }

    after(:build) do |recipe|
      recipe.cooking_ingredients << build(:cooking_ingredient, recipe: recipe, ingredient_name: "テスト材料1")
      recipe.procedures << build(:procedure, recipe: recipe, procedure_comment: "手順1")
    end

    factory :recipe_with_category do
      after(:create) do |recipe|
        room = create(:room) # Room レコードを生成
        category = create(:category) # Category レコードを生成
        recipe.room = room
        recipe.categories << category
      end
    end
  end
end
