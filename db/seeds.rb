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

stocks = Stock.create([
  { owner: users[1],  label:"Camera", price: 12.9000,quantity: 3},
  { owner: users[1],  label:"Hat", price: 30.0000, quantity:1},
  { owner: users[2],  label:"Bald Eagle", price: 999.9900, quantity:10},
  { owner: users[2],  label:"Kiwi", price: 49999.9900, quantity:3},
  { owner: users[3],  label:"Snakes and Ladders", price: 1.0000, quantity:1},
  { owner: users[3],  label:"Monopoly", price: 3.0000, quantity:1},
  { owner: users[4],  label:"Holy Grail", price: 0.9900, quantity:1},
  { owner: users[5],  label:"Meaning of Life", price: 42.0000, quantity:20},
  { owner: users[5],  label:"Cactus", price: 9.9900, quantity:3},
  { owner: users[5],  label:"Iris", price: 9.9900, quantity:15},
  { owner: users[6],  label:"Knives", price: 15.5000, quantity:4},
  { owner: users[6],  label:"Sword", price: 49.9700, quantity:8},
  { owner: users[7],  label:"Kryptonite", price: 0.5000, quantity:100},
  { owner: users[7],  label:"S Clothing Patch", price: 5.9900, quantity:1000},
  { owner: users[8],  label:"Table", price: 10.0000, quantity:1},
  { owner: users[9],  label:"Small Chair", price: 5.0000, quantity:1},
  { owner: users[10], label:"Coffee", price: 4.9900, quantity:10},
  { owner: users[10], label:"Muffin", price: 3.5000, quantity:10}
])

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
