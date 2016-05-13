# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([
  { username:"admin", realname:"Sally Smith",password:"1337"},
  { username:"j0nny", realname:"John Diggle",password:"password"},
  { username:"james", realname:"James Green",password:"green"},
  { username:"zoo", realname:"Monty Python",password:"dinosaur"},
  { username:"qwerty", realname:"Zoe Curtis",password:"purple"},
  { username:"Cambel", realname:"Thea Queen",password:"something"},
  { username:"Waities", realname:"Kara Danvers",password:"secure"},
  { username:"Cam", realname:"Camile Jones",password:"12345"},
  { username:"grod", realname:"Cameron Smith",password:"dfgh"},
  { username:"flash", realname:"Barry Allen",password:"falsh"},
  { username:"arrow", realname:"Oliver Queen",password:"arrow"}
])

stocks = []
[
  [users[1], "Camera",   12.9000,  3, ["camera.jpg"]],
  [users[1], "Hat",   30.0000,  1, ["hat.jpg"]],
  [users[2], "Bald Eagle",   999.9900,  10, ["bald-eagle.jpg"]],
  [users[2], "Kiwi",   49999.9900,  3, ["kiwi.jpg"]],
  [users[3], "Snakes and Ladders",   1.0000,  1, ["snakes-ladders.jpg"]],
  [users[3], "Monopoly",   3.0000,  1, ["monopoly.jpg"]],
  [users[4], "Holy Grail",   0.9900,  1, ["holy-grail.jpg"]],
  [users[5], "Meaning of Life",   42.0000,  20, ["meaning-of-life.jpg"]],
  [users[5], "Cactus",   9.9900,  3, ["cactus.jpg"]],
  [users[5], "Iris",   9.9900,  15, ["iris.jpg"]],
  [users[6], "Knives",   15.5000,  4, ["knives-1.jpg", "knives-2.jpg", "knives-3.jpg", "knives-4.jpg"]],
  [users[6], "Sword",   49.9700,  8, ["sword.jpg"]],
  [users[7], "Kryptonite",   0.5000,  100, ["kryptonite.jpg"]],
  [users[7], "S Clothing Patch",   5.9900,  1000, ["s-patch.jpg"]],
  [users[8], "Table",   10.0000,  1, ["table.jpg"]],
  [users[9], "Small Chair",   5.0000,  1, ["chair.jpg"]],
  [users[10], "Coffee", 4.9900,  10, ["coffee.jpg"]],
  [users[10], "Muffin", 3.5000,  10, ["muffin.jpg"]]
].each do |stock| 
  s = Stock.create(
    owner: stock[0],
    label: stock[1],
    price: stock[2],
    quantity: stock[3]
  )
  s.photos = stock[4].map { |p| Photo.create(image: File.open("db/images/#{p}")) }

  stocks << s
end

Transaction.create([
  {stock: stocks[2], user: users[0], kind: "PURCHASE"},
  {stock: stocks[0], user: users[9], kind: "PURCHASE"},
  {stock: stocks[3], user: users[2], kind: "PURCHASE"},
  {stock: stocks[4], user: users[3], kind: "PURCHASE"},
  {stock: stocks[13], user: users[0], kind: "PURCHASE"},
  {stock: stocks[13], user: users[9], kind: "PURCHASE"},
  {stock: stocks[13], user: users[7], kind: "PURCHASE"},
  {stock: stocks[17], user: users[6], kind: "PURCHASE"},
  {stock: stocks[17], user: users[6], kind: "PURCHASE"},
  {stock: stocks[17], user: users[10], kind: "PURCHASE"},
  {stock: stocks[10], user: users[10], kind: "PURCHASE"},
  {stock: stocks[10], user: users[10], kind: "PURCHASE"},
  {stock: stocks[10], user: users[10], kind: "PURCHASE"},
  {stock: stocks[10], user: users[10], kind: "PURCHASE"},
  {stock: stocks[8], user: users[10], kind: "PURCHASE"},
  {stock: stocks[2], user: users[10], kind: "PURCHASE"},
  {stock: stocks[16], user: users[10], kind: "PURCHASE"},
  {stock: stocks[12], user: users[10], kind: "PURCHASE"}
])
