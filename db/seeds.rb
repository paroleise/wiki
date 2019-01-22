# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.new(
  email: "hoge@fuga.com",
  password: "00000000",
  name: "ABCDEFGH"
)

u1.save!

a1 = Administrator.new(
  name: "sakuraiyushi",
  password: "hiraginokakugothic"
)

u1.save!