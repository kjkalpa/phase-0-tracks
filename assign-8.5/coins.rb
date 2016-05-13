def main_heading
  Gem.win_platform? ? (system "cls") : (system "clear")
  r_indent = " " * 26
  puts 
  puts r_indent + "Coin Collection Maintenance"
  puts
  puts r_indent + "1. Add Coins"
  puts r_indent + "2. Sell Coins"
  puts r_indent + "3. View Collection"

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
      tran_type VARCHAR(2),
      sale_price REAL,
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

  insert_default_grading = <<-SQL
    INSERT INTO coins VALUES 
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
  puts current
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

