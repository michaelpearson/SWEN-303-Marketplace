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
  [users[1], "Camera",  12, ["camera.jpg"], "This is a description for Camera"],
  [users[1], "Hat",  30, ["hat.jpg"], "This is a description for Hat"],
  [users[2], "Bald Eagle",  999, ["bald-eagle.jpg"], "This is a description for Bald Eagle"],
  [users[2], "Kiwi",  49999, ["kiwi.jpg"], "This is a description for Kiwi"],
  [users[3], "Snakes and Ladders",  1, ["snakes-ladders.jpg"], "This is a description for Snakes and Ladders"],
  [users[3], "Monopoly",  3, ["monopoly.jpg"], "This is a description for Monopoly"],
  [users[4], "Holy Grail",  0, ["holy-grail.jpg"], "This is a description for Holy Grail"],
  [users[5], "Meaning of Life",  42, ["meaning-of-life.jpg"], "This is a description for Meaning of Life"],
  [users[5], "Cactus",  9, ["cactus.jpg"], "This is a description for Cactus"],
  [users[5], "Iris",  9, ["iris.jpg"], "This is a description for Iris"],
  [users[6], "Knives",  15, ["knives-1.jpg", "knives-2.jpg", "knives-3.jpg", "knives-4.jpg"], "This is a description for Knives"],
  [users[6], "Sword",  49, ["sword.jpg"], "This is a description for Sword"],
  [users[7], "Kryptonite",  0, ["kryptonite.jpg"], "This is a description for Kryptonite"],
  [users[7], "S Clothing Patch",  5, ["s-patch.jpg"], "This is a description for S Clothing Patch"],
  [users[8], "Table",  10, ["table.jpg"], "This is a description for Table"],
  [users[9], "Small Chair",  5, ["chair.jpg"], "This is a description for Small Chair"],
  [users[10], "Coffee",  4, ["coffee.jpg"], "This is a description for Coffee"],
  [users[10], "Muffin",  3, ["muffin.jpg"], "This is a description for Muffin"]
].each do |stock| 
  s = Stock.create(
    owner: stock[0],
    label: stock[1],
    price: stock[2],
    description: stock[4]
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
