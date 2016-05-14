# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([
  { username:"admin", realname:"Sally Smith",password:"1337", token_count: rand(0..10)},
  { username:"j0nny", realname:"John Diggle",password:"password", token_count: rand(0..10)},
  { username:"james", realname:"James Green",password:"green", token_count: rand(0..10)},
  { username:"zoo", realname:"Monty Python",password:"dinosaur", token_count: rand(0..10)},
  { username:"qwerty", realname:"Zoe Curtis",password:"purple", token_count: rand(0..10)},
  { username:"Cambel", realname:"Thea Queen",password:"something", token_count: rand(0..10)},
  { username:"Waities", realname:"Kara Danvers",password:"secure", token_count: rand(0..10)},
  { username:"Cam", realname:"Camile Jones",password:"12345", token_count: rand(0..10)},
  { username:"grod", realname:"Cameron Smith",password:"dfgh", token_count: rand(0..10)},
  { username:"flash", realname:"Barry Allen",password:"falsh", token_count: rand(0..10)},
  { username:"arrow", realname:"Oliver Queen",password:"arrow", token_count: rand(0..10)}
])

stocks = []
[
  [users[1], "Camera",  12, ["camera.jpg"], "This is a description for Camera", "Misc"],
  [users[1], "Hat",  30, ["hat.jpg"], "This is a description for Hat", "Misc"],
  [users[2], "Bald Eagle",  35, ["bald-eagle.jpg"], "This is a description for Bald Eagle", "Animal"],
  [users[2], "Kiwi",  80, ["kiwi.jpg"], "This is a description for Kiwi", "Animal"],
  [users[3], "Snakes and Ladders",  1, ["snakes-ladders.jpg"], "This is a description for Snakes and Ladders", "Game"],
  [users[3], "Monopoly",  3, ["monopoly.jpg"], "This is a description for Monopoly", "Game"],
  [users[4], "Holy Grail",  100, ["holy-grail.jpg"], "This is a description for Holy Grail", "Misc"],
  [users[5], "Meaning of Life",  42, ["meaning-of-life.jpg"], "This is a description for Meaning of Life", "Misc"],
  [users[5], "Cactus",  15, ["cactus.jpg"], "This is a description for Cactus", "Plant"],
  [users[5], "Iris",  8, ["iris.jpg"], "This is a description for Iris", "Plant"],
  [users[6], "Knives",  10, ["knives-1.jpg", "knives-2.jpg", "knives-3.jpg", "knives-4.jpg"], "This is a description for Knives", "Weapon"],
  [users[6], "Sword",  35, ["sword.jpg"], "This is a description for Sword", "Weapon"],
  [users[7], "Kryptonite",  10, ["kryptonite.jpg"], "This is a description for Kryptonite", "Weapon"],
  [users[7], "S Clothing Patch",  5, ["s-patch.jpg"], "This is a description for S Clothing Patch", "Clothing"],
  [users[8], "Table",  10, ["table.jpg"], "This is a description for Table", "Furniture"],
  [users[9], "Small Chair",  30, ["chair.jpg"], "This is a description for Small Chair", "Furniture"],
  [users[10], "Coffee",  4, ["coffee.jpg"], "This is a description for Coffee", "Food"],
  [users[10], "Muffin",  3, ["muffin.jpg"], "This is a description for Muffin", "Food"]
].each do |stock|
  s = Stock.create(
    owner:        stock[0],
    label:        stock[1],
    price:        stock[2],
    description:  stock[4],
    category:     stock[5]
  )
  s.photos = stock[3].map { |p| Photo.create(image: File.open("db/images/#{p}")) }

  stocks << s
end

Transaction.create([
  {stock: stocks[2], user: users[0], kind: "BID"},
  {stock: stocks[0], user: users[9], kind: "BID"},
  {stock: stocks[3], user: users[2], kind: "BID"},
  {stock: stocks[4], user: users[3], kind: "BID"},
  {stock: stocks[13], user: users[0], kind: "BID"},
  {stock: stocks[13], user: users[9], kind: "BID"},
  {stock: stocks[13], user: users[7], kind: "BID"},
  {stock: stocks[17], user: users[6], kind: "BID"},
  {stock: stocks[17], user: users[6], kind: "BID"},
  {stock: stocks[17], user: users[10], kind: "BID"},
  {stock: stocks[10], user: users[10], kind: "BID"},
  {stock: stocks[10], user: users[10], kind: "BID"},
  {stock: stocks[10], user: users[10], kind: "BID"},
  {stock: stocks[10], user: users[10], kind: "BID"},
  {stock: stocks[8], user: users[10], kind: "BID"},
  {stock: stocks[2], user: users[10], kind: "BID"},
  {stock: stocks[16], user: users[10], kind: "BID"},
  {stock: stocks[12], user: users[10], kind: "BID"}
])
