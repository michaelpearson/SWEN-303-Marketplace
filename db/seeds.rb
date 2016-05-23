PREFIX = "This is a description for a"
LOREM = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

users = User.create([
  { username:"admin", realname:"Sally Smith", email:"Sally.Smith@myrafflr.net", password:"1337", token_count: rand(10..100)},
  { username:"j0nny", realname:"John Diggle", email:"John.Diggle@myrafflr.net", password:"password", token_count: rand(10..100)},
  { username:"james", realname:"James Green", email:"James.Green@myrafflr.net", password:"green", token_count: rand(10..100)},
  { username:"zoo", realname:"Monty Python", email:"Monty.Python@myrafflr.net", password:"dinosaur", token_count: rand(10..100)},
  { username:"qwerty", realname:"Zoe Curtis", email:"Zoe.Curtis@myrafflr.net", password:"purple", token_count: rand(10..100)},
  { username:"Cambel", realname:"Thea Queen", email:"Thea.Queen@myrafflr.net", password:"something", token_count: rand(10..100)},
  { username:"Waities", realname:"Kara Danvers", email:"Kara.Danvers@myrafflr.net", password:"secure", token_count: rand(10..100)},
  { username:"Cam", realname:"Camile Jones", email:"Camile.Jones@myrafflr.net", password:"12345", token_count: rand(10..100)},
  { username:"grod", realname:"Cameron Smith", email:"Cameron.Smith@myrafflr.net", password:"dfgh", token_count: rand(10..100)},
  { username:"flash", realname:"Barry Allen", email:"Barry.Allen@myrafflr.net", password:"falsh", token_count: rand(10..100)},
  { username:"arrow", realname:"Oliver Queen", email:"Oliver.Queen@myrafflr.net", password:"arrow", token_count: rand(10..100)}
])

stocks = [
  [users[1], "Camera",  12, ["camera.jpg"], "#{PREFIX} Camera. #{LOREM}", "Misc"],
  [users[1], "Hat",  30, ["hat.jpg"], "#{PREFIX} Hat. #{LOREM}", "Misc"],
  [users[1], "Bald Eagle",  35, ["bald-eagle.jpg"], "#{PREFIX} Bald Eagle. #{LOREM}", "Animal"],
  [users[1], "Kiwi",  80, ["kiwi.jpg"], "#{PREFIX} Kiwi. #{LOREM}", "Animal"],
  [users[1], "Snakes and Ladders",  1, ["snakes-ladders.jpg"], "#{PREFIX} Snakes and Ladders. #{LOREM}", "Game"],
  [users[1], "Monopoly",  3, ["monopoly.jpg"], "#{PREFIX} Monopoly. #{LOREM}", "Game"],
  [users[1], "Holy Grail",  100, ["holy-grail.jpg"], "#{PREFIX} Holy Grail. #{LOREM}", "Misc"],
  [users[2], "Meaning of Life",  42, ["meaning-of-life.jpg"], "#{PREFIX} Meaning of Life. #{LOREM}", "Misc"],
  [users[2], "Cactus",  15, ["cactus.jpg"], "#{PREFIX} Cactus. #{LOREM}", "Plant"],
  [users[2], "Iris",  8, ["iris.jpg"], "#{PREFIX} Iris. #{LOREM}", "Plant"],
  [users[2], "Knives",  10, ["knives-1.jpg", "knives-2.jpg", "knives-3.jpg", "knives-4.jpg"], "#{PREFIX} Knives. #{LOREM}", "Weapon"],
  [users[2], "Sword",  35, ["sword.jpg"], "#{PREFIX} Sword. #{LOREM}", "Weapon"],
  [users[2], "Kryptonite",  10, ["kryptonite.jpg"], "#{PREFIX} Kryptonite. #{LOREM}", "Weapon"],
  [users[3], "S Clothing Patch",  5, ["s-patch.jpg"], "#{PREFIX} S Clothing Patch. #{LOREM}", "Clothing"],
  [users[3], "Table",  10, ["table.jpg"], "#{PREFIX} Table. #{LOREM}", "Furniture"],
  [users[3], "Small Chair",  30, ["chair.jpg"], "#{PREFIX} Small Chair. #{LOREM}", "Furniture"],
  [users[3], "Coffee",  4, ["coffee.jpg"], "#{PREFIX} Coffee. #{LOREM}", "Food"],
  [users[3], "Muffin",  3, ["muffin.jpg"], "#{PREFIX} Muffin. #{LOREM}", "Food"]
].map! do |stock|
  Stock.create(
    owner:        stock[0],
    label:        stock[1],
    price:        stock[2],
    description:  stock[4],
    category:     stock[5]
  ).tap do |s|
    s.photos = stock[3].map do |p|
      Photo.create(image: File.open("db/images/#{p}"))
    end
  end
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
