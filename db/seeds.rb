# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




User.create!(name: "admin_user", email: "admin@example.com", password: "111111", password_confirmation: "111111", admin: true)
User.create!(name: "user2", email: "2222@example.com", password: "222222", password_confirmation: "222222", admin: false)
User.create!(name: "user3", email: "3333@example.com", password: "333333", password_confirmation: "333333", admin: false)
User.create!(name: "user4", email: "4444@example.com", password: "444444", password_confirmation: "444444", admin: false)
User.create!(name: "user5", email: "5555@example.com", password: "555555", password_confirmation: "555555", admin: false)
User.create!(name: "user6", email: "6666@example.com", password: "666666", password_confirmation: "666666", admin: false)

Room.create!(name: "Room1(seed)", owner_id: 1)
Room.create!(name: "Room2", owner_id: 2)
Room.create!(name: "Room3", owner_id: 3)
Room.create!(name: "Room4", owner_id: 4)
Room.create!(name: "Room5", owner_id: 5)



# Room1にユーザー1, ユーザー2, ユーザー3を所属させる
RoomAssign.create!(user_id: 4, room_id: 7 )
RoomAssign.create!(user_id: 2, room_id: 7)
RoomAssign.create!(user_id: 3, room_id: 7)

# Room2にユーザー2, ユーザー3, ユーザー4を所属させる
RoomAssign.create!(user_id: 5, room_id: 8)
RoomAssign.create!(user_id: 3, room_id: 8)
RoomAssign.create!(user_id: 4, room_id: 8)

# Room3にユーザー3, ユーザー4, ユーザー5を所属させる
RoomAssign.create!(user_id: 1, room_id: 9)
RoomAssign.create!(user_id: 4, room_id: 9)
RoomAssign.create!(user_id: 5, room_id: 9)


categories_data = [
  { name: "生菓子" },
  { name: "焼き菓子" },
  { name: "冷菓" },
  { name: "ゼリー" },
  { name: "季節限定" }
]

categories_data.each do |data|
  Category.create!(data)
end

# ババロアのレシピ５つ
5.times do |n|
user = User.find_by(name: "user3")
category = Category.find_by(name: "冷菓")

recipe = Recipe.create!(
  title: "ババロア",
  short_comment: "美味しいです",
  image: File.open("./public/images/ババロア.jpg"),
  tortal_quantity: "20個分",
  public: true,
  user: user,
  room_id: 7,
  category_ids: [category.id]
)
# 材料の作成
cooking_ingredient1 = CookingIngredient.create!(ingredient_name: "いちごジャム", quantity: 70, unit: "g", recipe: recipe)
cooking_ingredient2 = CookingIngredient.create!(ingredient_name: "牛乳", quantity: 50, unit: "g", recipe: recipe)
cooking_ingredient3 = CookingIngredient.create!(ingredient_name: "生クリーム", quantity: 2, unit: "g", recipe: recipe)
cooking_ingredient4 = CookingIngredient.create!(ingredient_name: "グラニュー糖", quantity: 120, unit: "g", recipe: recipe)
cooking_ingredient5 = CookingIngredient.create!(ingredient_name: "ゼラチン", quantity: 2, unit: "g", recipe: recipe)
cooking_ingredient6 = CookingIngredient.create!(ingredient_name: "いちご", quantity: 2, unit: "個", recipe: recipe)

# 手順の作成
procedure = Procedure.create!(
  procedure_comment: "   \r\n1,ボウルに粉ゼラチンと水を加えて、ふやかす。生クリームは7分立てにする。\r\n\r\n2. 耐熱容器にいちごジャムと牛乳、ふやかしたゼラチンを加えて混ぜ、電子レンジ（600W）で30秒加熱する。\r\n\r\n3.２を冷まして、１の生クリームを2回に分けて加え、優しく混ぜ合わせる。\r\n    生クリームを分けて加えると、泡をつぶすことなく均一に混ぜることができる。\r\n\r\n4. ３を容器に等分に注ぎ、冷やし固める。混ぜ合わせたAとお好みでいちごをのせる。 く　　",
  recipe: recipe
)
end

user = User.find_by(name: "user2")
category = Category.find_by(name: "焼き菓子")

recipe = Recipe.create!(
  title: "クッキー(commentseed)",
  short_comment: "簡単なクッキーです",
  image: File.open("./public/images/クッキー.jpg"),
  tortal_quantity: "20個分",
    public: true,
    user: user,
    room_id: 7,
    category_ids: [category.id]
    )
    # 材料の作成
    cooking_ingredient1 = CookingIngredient.create!(ingredient_name: "薄力粉", quantity: 120, unit: "g", recipe: recipe)
    cooking_ingredient2 = CookingIngredient.create!(ingredient_name: "バター", quantity: 50, unit: "g", recipe: recipe)
    cooking_ingredient3 = CookingIngredient.create!(ingredient_name: "卵", quantity: 2, unit: "個", recipe: recipe)
    cooking_ingredient4 = CookingIngredient.create!(ingredient_name: "グラニュー糖", quantity: 120, unit: "g", recipe: recipe)
    
    # 手順の作成
    procedure = Procedure.create!(
      procedure_comment: "   下準備\r\n\r\n   バターは縦に厚さ1cmに切り、卵黄はラップをかけて、ともに室温に30分ほど置く。\r\n    薄力粉は万能こし器でふるう。\r\n    天板の大きさに合わせて切ったオーブン用シートを2枚用意する。\r\n\r\n１，ボールにバターを入れ、泡立て器でよく練り混ぜる。なめらかなクリーム状になったら、グラニュー糖、塩を一度に加え、\r\n　　ふわっとして白っぽくなるまで、ぐるぐるとよくすり混ぜる。\r\n\r\n２．卵黄を加えてぐるぐると手早く混ぜ、まんべんなく混ざったら、薄力粉を1カ所に固まらないように加える。\r\n\r\n３．ゴムべらに持ち替え、底からすくい上げて、さっくりと切るようにしながらよく混ぜ合わせる。粉っぽさが完全になくなり、\r\n　　全体がしっとりとしたそぼろ状になったらOK。\r\n\r\n４．手でかるくつかむようにしてひとつにまとめ、生地をラップで包んで四角く形を整える。冷蔵庫に入れ、30分以上おいてなじませ\r\n　　る。生地を取り出し、オーブンを180℃に温めはじめる。\r\n\r\n５．オーブン用シートごと天板にのせ、180℃のオーブンで10～13分焼く　　",
      recipe: recipe
      )
      
      
      comments_data = [
        { user_id: 4, recipe_id: 6, content: "美味しそうなレシピですね！" },
        { user_id: 3, recipe_id: 6, content: "作ってみたいと思います！" },
  { user_id: 4, recipe_id: 6, content: "簡単でした" },
  { user_id: 2, recipe_id: 6, content: "美味しかったです" },
  { user_id: 5, recipe_id: 6, content: "美味しく作れました"},
  { user_id: 5, recipe_id: 6, content: "160度のオーブン試しました" },
  { user_id: 5, recipe_id: 6, content: "美味しかったです" }
]

# クッキーに対してのコメント
comments_data.each do |data|
  Comment.create!(data)
end



# Room1 コメント

room_comments_data = [
  { user_id: 4, room_id: 7, content: "明日はモンブランの仕込みです" },
  { user_id: 2, room_id: 7, content: "了解です" },
  { user_id: 3, room_id: 7, content: "予約は４０名です" },
  { user_id: 2, room_id: 7, content: "宴会の予約があります" },
  { user_id: 3, room_id: 7, content: "12時から出勤します" },
  { user_id: 2, room_id: 7, content: "明日お休みさせて頂きます" },
  { user_id: 3, room_id: 7, content: "いちご発注お願いします" }
]


room_comments_data.each do |data|
  RoomComment.create!(data)
end


# Room1にレシピ
5.times do |n|
user = User.find_by(name: "user2")
category = Category.find_by(name: "季節限定")

recipe = Recipe.create!(
  title: "tarte à la mangue",
  short_comment: "8月限定です",
  image: File.open("./public/images/スクリーンショット 2023-08-14 17.18.11.png"),
  tortal_quantity: "20個分",
  public: false,
  user: user,
  room_id: 7,
  category_ids: [category.id]
)
# 材料の作成
cooking_ingredient1 = CookingIngredient.create!(ingredient_name: "タルト生地", quantity:"", unit:"", recipe: recipe)
cooking_ingredient2 = CookingIngredient.create!(ingredient_name: "バター", quantity: 60, unit: "g", recipe: recipe)
cooking_ingredient3 = CookingIngredient.create!(ingredient_name: "グラニュー糖", quantity: 30, unit: "g", recipe: recipe)
cooking_ingredient4 = CookingIngredient.create!(ingredient_name: "塩", quantity: 0.5, unit: "g", recipe: recipe)
cooking_ingredient5 = CookingIngredient.create!(ingredient_name: "薄力粉", quantity: 100, unit: "g", recipe: recipe)
cooking_ingredient6 = CookingIngredient.create!(ingredient_name: "全卵", quantity: 15, unit: "g", recipe: recipe)
cooking_ingredient7 = CookingIngredient.create!(ingredient_name: "クレームダマンド", quantity: "", unit: "", recipe: recipe)
cooking_ingredient8 = CookingIngredient.create!(ingredient_name: "バター", quantity: 100, unit: "g", recipe: recipe)
cooking_ingredient9 = CookingIngredient.create!(ingredient_name: "アーモンドプードル", quantity: 40, unit: "g", recipe: recipe)
cooking_ingredient10 = CookingIngredient.create!(ingredient_name: "ラ フルティエ  マンゴー", quantity:"" , unit:"" , recipe: recipe)
cooking_ingredient11 = CookingIngredient.create!(ingredient_name: "マンゴーピューレ", quantity: 60, unit: "g", recipe: recipe) 
cooking_ingredient12 = CookingIngredient.create!(ingredient_name: "牛乳", quantity: 20, unit: "g", recipe: recipe)
cooking_ingredient13 = CookingIngredient.create!(ingredient_name: "卵黄", quantity: 20, unit: "g", recipe: recipe)
cooking_ingredient14 = CookingIngredient.create!(ingredient_name: "仕上げ", quantity:"" , unit: "", recipe: recipe)
cooking_ingredient15 = CookingIngredient.create!(ingredient_name: "生クリーム", quantity: 100, unit: "g", recipe: recipe)
cooking_ingredient16 = CookingIngredient.create!(ingredient_name: "マンゴー", quantity: 1, unit: "個", recipe: recipe)
cooking_ingredient17 = CookingIngredient.create!(ingredient_name: "ココナッツファイン", quantity:"" , unit: "適量", recipe: recipe)

# 手順の作成
procedure = Procedure.create!(
  procedure_comment: " タルト生地\r\n\r\n　１．常温に戻したバターに粉砂糖と塩を入れてムラが無くなるまで混ぜ合わせる。\r\n　　　全卵を2回に分けて入れ、その都度ムラが無い状態まで混ぜ合わせる。　薄力粉を入れて粉っぽさが無くなるまで混ぜ合わせる。\r\n　　　OPPシートに生地を挟んで3㎜の厚さになるようにのばす。\r\n       　冷凍庫に入れて生地を約30分程度、しっかりと冷やし固める。\r\n\r\n　2. パテ抜型9番を使用して生地を6枚抜く。 160℃のオーブンで約20分焼成を行う。\r\n    　焼きあがったらケーキクーラーの上で粗熱をとり、型から生地を外しておく。\r\n\r\nダマンド\r\n\r\n　１．　常温に戻したバターにグラニュー糖を入れて、ムラが無くなるまで混ぜ合わせる。\r\n　　　　全卵を3~4回に分けて入れ、その都度ムラが無いようにしっかりと混ぜ合わせる。\r\n　　　　アーモンドプードルを入れて粉っぽさが無くなるまで混ぜ合わせる。\r\n\r\nクレムパティシエールマンゴー\r\n\r\n　１．鍋にマンゴーピューレと牛乳を入れ、沸騰直前まで温める。\r\n　　　プードルアクレームを入れ、粉っぽさが無くなるまで混ぜ合わせる。\r\n\r\n飾り\r\n\r\n　１．土台に22のディプロマットマンゴーを中央に絞り、バランスを見ながらカットしたマンゴーをデコレーションする。\r\n　　　泡立てておいた仕上げ用の生クリーム(100g)を口金を付けた絞り袋に入れ、タルトの中央にこんもり絞る。\r\n　　　ココナッツファインをふりかけ、コルネ袋に入れたミロワールヌートルを雫のように飾り完成。　　",
  recipe: recipe
)
end

# Room1にたすくのデータ

tasks_data = [
  { title: "予約", content: "texttexttexttexttexttexttexttexttexttexttexttext", start_time: DateTime.now, room_id: 7},
  { title: "予約", content: "texttexttexttexttexttexttexttexttexttexttexttext", start_time: DateTime.now + 1.day, room_id: 7 },
  { title: "予約", content: "texttexttexttexttexttexttexttexttexttexttexttext", start_time: DateTime.now + 3.days, room_id: 7 },
  { title: "予約", content: "texttexttexttexttexttexttexttexttexttexttexttext", start_time: DateTime.now + 4.days, room_id: 7 },
  { title: "予約", content: "texttexttexttexttexttexttexttexttexttexttexttext", start_time: DateTime.now + 5.days, room_id: 7 },
  { title: "予約", content: "texttexttexttexttexttexttexttexttexttexttexttext", start_time: DateTime.now + 6.days, room_id: 7 }
]

tasks_data.each do |data|
  Task.create!(data)
end

# user2でログインするとroomのseedデータが確認できます