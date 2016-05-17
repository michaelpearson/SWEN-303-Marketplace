PREFIX = "This is a description for a"
LOREM = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

users = User.create([
  { username:"admin", realname:"Sally Smith",password:"1337", token_count: rand(10..100)},
  { username:"j0nny", realname:"John Diggle",password:"password", token_count: rand(10..100)},
  { username:"james", realname:"James Green",password:"green", token_count: rand(10..100)},
  { username:"zoo", realname:"Monty Python",password:"dinosaur", token_count: rand(10..100)},
  { username:"qwerty", realname:"Zoe Curtis",password:"purple", token_count: rand(10..100)},
  { username:"Cambel", realname:"Thea Queen",password:"something", token_count: rand(10..100)},
  { username:"Waities", realname:"Kara Danvers",password:"secure", token_count: rand(10..100)},
  { username:"Cam", realname:"Camile Jones",password:"12345", token_count: rand(10..100)},
  { username:"grod", realname:"Cameron Smith",password:"dfgh", token_count: rand(10..100)},
  { username:"flash", realname:"Barry Allen",password:"falsh", token_count: rand(10..100)},
  { username:"arrow", realname:"Oliver Queen",password:"arrow", token_count: rand(10..100)}
])

stocks = [
  [users[1], "Camera",  12, ["camera.jpg"], "#{PREFIX} Camera. #{LOREM}"],
  [users[1], "Hat",  30, ["hat.jpg"], "#{PREFIX} Hat. #{LOREM}"],
  [users[2], "Bald Eagle",  35, ["bald-eagle.jpg"], "#{PREFIX} Bald Eagle. #{LOREM}"],
  [users[2], "Kiwi",  80, ["kiwi.jpg"], "#{PREFIX} Kiwi. #{LOREM}"],
  [users[3], "Snakes and Ladders",  1, ["snakes-ladders.jpg"], "#{PREFIX} Snakes and Ladders. #{LOREM}"],
  [users[3], "Monopoly",  3, ["monopoly.jpg"], "#{PREFIX} Monopoly. #{LOREM}"],
  [users[4], "Holy Grail",  100, ["holy-grail.jpg"], "#{PREFIX} Holy Grail. #{LOREM}"],
  [users[5], "Meaning of Life",  42, ["meaning-of-life.jpg"], "#{PREFIX} Meaning of Life. #{LOREM}"],
  [users[5], "Cactus",  15, ["cactus.jpg"], "#{PREFIX} Cactus. #{LOREM}"],
  [users[5], "Iris",  8, ["iris.jpg"], "#{PREFIX} Iris. #{LOREM}"],
  [users[6], "Knives",  10, ["knives-1.jpg", "knives-2.jpg", "knives-3.jpg", "knives-4.jpg"], "#{PREFIX} Knives. #{LOREM}"],
  [users[6], "Sword",  35, ["sword.jpg"], "#{PREFIX} Sword. #{LOREM}"],
  [users[7], "Kryptonite",  10, ["kryptonite.jpg"], "#{PREFIX} Kryptonite. #{LOREM}"],
  [users[7], "S Clothing Patch",  5, ["s-patch.jpg"], "#{PREFIX} S Clothing Patch. #{LOREM}"],
  [users[8], "Table",  10, ["table.jpg"], "#{PREFIX} Table. #{LOREM}"],
  [users[9], "Small Chair",  30, ["chair.jpg"], "#{PREFIX} Small Chair. #{LOREM}"],
  [users[10], "Coffee",  4, ["coffee.jpg"], "#{PREFIX} Coffee. #{LOREM}"],
  [users[10], "Muffin",  3, ["muffin.jpg"], "#{PREFIX} Muffin. #{LOREM}"]
]
stocks.map! do |stock|
  Stock.create(
    owner: stock[0],
    label: stock[1],
    price: stock[2],
    description: stock[4]
  ).tap do |s|
    s.photos = stock[3].map  do |p|
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
