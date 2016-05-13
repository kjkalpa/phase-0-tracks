def main_heading
  Gem.win_platform? ? (system "cls") : (system "clear")
  r_indent = " " * 26
  puts 
  puts r_indent + "Coin Collection Maintenance"
  puts
  puts r_indent + "1. Add Coins"
  puts r_indent + "2. Sell Coins"
  puts r_indent + "3. View Collection"
  puts r_indent + "4. Quit"

end

def add_coin_heading
  Gem.win_platform? ? (system "cls") : (system "clear")
  r_indent = " " * 26
  puts r_indent + "Add to Coin Collection"
  puts 
end

def sell_coin_heading
  Gem.win_platform? ? (system "cls") : (system "clear")
  r_indent = " " * 26
  puts 
  puts r_indent + "Sell From Coin Collection"
end

def view_coin_heading
  Gem.win_platform? ? (system "cls") : (system "clear")
  r_indent = " " * 26
  puts 
  puts r_indent + "View Coin Collection"
end

def view_collection(db)

end

def create_tables(db)
  create_table_coins = <<-SQL
    CREATE TABLE IF NOT EXISTS coins(
      id INTEGER PRIMARY KEY,
      description VARCHAR(255)
      UNIQUE ON CONFLICT IGNORE
    )
    SQL

  create_table_grades = <<-SQL
    CREATE TABLE IF NOT EXISTS grades(
      id INTEGER PRIMARY KEY,
      grade VARCHAR(5),
      description VARCHAR(25)
      UNIQUE ON CONFLICT IGNORE
    )
    SQL

  create_table_collection = <<-SQL
    CREATE TABLE IF NOT EXISTS collection(
      id INTEGER PRIMARY KEY,
      coin_id INT,
      year INT,
      condition INT,
      purchase_price REAL,
      sale_price REAL,
      status VARCHAR(2),
      FOREIGN KEY (coin_id) REFERENCES coins(id),
      FOREIGN KEY (condition) REFERENCES grades(id)
    )
    SQL

  create_table_trans = <<-SQL
    CREATE TABLE IF NOT EXISTS coin_trans(
      id INTEGER PRIMARY KEY,
      tran_date TEXT,
      tran_type VARCHAR(10),
      price REAL,
      coll_id INT,
      FOREIGN KEY (coll_id) REFERENCES collection(id)
    )
    SQL

  insert_default_coins = <<-SQL
    INSERT INTO coins VALUES 
    (null, "Pennies"), (null, "Nickels"), 
    (null, "Dimes"), (null, "Quarters"), 
    (null, "Half Dollars"), (null, "Dollars")
  SQL

  insert_default_grades = <<-SQL
    INSERT INTO grades VALUES 
    (null, "G", "Good"), 
    (null, "VG", "Very Good"), 
    (null, "F", "Fine"), 
    (null, "VF", "Very Fine"), 
    (null, "EF", "Extra Fine"), 
    (null, "UNC", "Mint")
  SQL

  db.execute(create_table_coins) 
  db.execute(create_table_grades)
  db.execute(create_table_collection)
  db.execute(create_table_trans)
  db.execute(insert_default_coins)
  db.execute(insert_default_grades)

end

########## DRIVER CODE ##########

require 'sqlite3'
require 'date'
current = Date.today


# create SQLite3 database
db = SQLite3::Database.new("coins.db")

create_tables(db)

screen = 0

while (screen < 1) || (screen > 3)
  main_heading
  print "Pick a screen > "
  screen = gets.chomp.to_i
end


# Prompt user for action
# Accept response and go to corresponding screen

# Add coins
# Prompt user for corresponding db entries
# Validate answers
# Insert into collections
# Insert into coin_trans

coin_string = String.new
valid_coins = []
valid_grades = []
r_indent = " " * 26
response_add_coin_type = 0
response_add_condition = 0

if screen == 1 
  add_coin_heading
  coin_types = db.execute("SELECT * FROM coins")

  coin_types.each do |coin|
    valid_coins << coin[0]
    puts r_indent + coin.join(".")
  end

  until valid_coins.include?(response_add_coin_type)
    puts 
    print "Enter the number of the coin type you're adding to collection: "
    response_add_coin_type = gets.chomp.to_i
  end
  
  print "Enter the year of the coin (yyyy): "
  response_add_year = gets.chomp.to_i  

  grade_types = db.execute("SELECT * FROM grades")
  grade_types.each do |grade|
    valid_grades << grade[0]
    # puts r_indent + grade[0] + "." + grade[2]
    puts r_indent + grade[0].to_s + "." + grade[2].to_s
  end

  until valid_grades.include?(response_add_condition)
    puts
    print "Enter the number of the condition of the coin: "
    response_add_condition = gets.chomp.to_i
  end 

  print "Enter the purchase price (0.00): "
  response_add_price = gets.chomp 

  db.execute("INSERT INTO collection (coin_id, year, condition, purchase_price, sale_price, status) VALUES (?,?,?,?,?,?)", [response_add_coin_type, response_add_year, response_add_condition, response_add_price, 0, "A"])

  prim_key = db.execute("SELECT last_insert_rowid()")

  db.execute("INSERT INTO coin_trans (tran_date, tran_type, price, coll_id) VALUES (?,?,?,?)", [current.to_s, "Add", response_add_price, prim_key])


end

if screen == 2
  sell_coin_heading
  # display_collection()
end

if screen == 3
  view_coin_heading
end
















