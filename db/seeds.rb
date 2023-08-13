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

Room.create!(name: "Room1", owner_id: 1)
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