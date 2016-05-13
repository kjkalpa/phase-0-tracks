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



########## DRIVER CODE ##########

require 'sqlite3'
require 'date'
current = Date.today


# create SQLite3 database
db = SQLite3::Database.new("coins.db")



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

