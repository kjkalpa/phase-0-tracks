def main_heading
  Gem.win_platform? ? (system "cls") : (system "clear")
  r_indent = " " * 26
  puts 
  puts r_indent + "Coin Collection Maintenance"
  puts
  puts r_indent + "1. Add Coins"
  puts r_indent + "2. Sell Coins"
  puts r_indent + "3. View Collection"
  puts r_indent + "4. View Transactions"
  puts r_indent + "5. Update Collection"
  puts r_indent + "6. Quit"

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
  r_indent2 = " " * 12
  puts 
  puts r_indent + "View Coin Collection"
  puts 
  puts r_indent2 + "ID   Coin             Year  Grade          Paid"
  puts r_indent2 + "--------------------------------------------------"
end

def view_coin_trans
  Gem.win_platform? ? (system "cls") : (system "clear")
  r_indent = " " * 26
  puts 
  puts r_indent + "View Coin Transactions"
  puts 
  puts "     Tran Type      ID#  Coin              Date          Sale $     Paid $"
  puts "     ---------------------------------------------------------------------"

end

def convert_to_dollar(amt)
    p_cent = amt.to_i % 100
    p_doll = amt.to_i / 100
    p_dol_cent = "%5.2f" % (p_doll.to_s + "." + p_cent.to_s)
    return p_dol_cent
end

def view_collection(db)
  temp_array = Array.new
  dollar_amt = 0.0

  r_indent = " " * 12
  collection = db.execute("SELECT * FROM collection c JOIN coins cn ON c.coin_id = cn.id JOIN grades g ON c.condition = g.id WHERE status = 'A'")

  collection.each do |coin|
    temp_array << coin[0]
    tran_id = '%-4.4s' % coin[0]
    dollar_amt = convert_to_dollar(coin[4])
    tran_coin = format_coin_type(coin[8])
    tran_grade = '%-11.10s' % coin[11]

    puts r_indent + "#{tran_id} #{tran_coin}  #{coin[2]}  #{tran_grade}   $#{dollar_amt}"
  end
  puts ""
  return temp_array
end

def format_coin_type(coin)
    str_coin = '%-15.15s' % coin
    return str_coin
end

def view_transactions(db)
  transactions = db.execute("SELECT ct.tran_date, ct.tran_type, ct.price, cl.year, cl.purchase_price, cl.sale_price, cl.id, cs.description, cs.id FROM coin_trans ct JOIN collection cl ON ct.coll_id = cl.id JOIN coins cs ON cl.coin_id = cs.id")

  transactions.each do |recs|
    tran_coin = format_coin_type(recs[7])
    tran_date = recs[0]
    tran_coin_id = '%-4.4s' % recs[6]
    tran_typ  = '%-9.4s' % recs[1]
    if recs[1] == 'Add' 
      tran_sold_for = '%10.10s' % convert_to_dollar(0)
    else
      tran_sold_for = '%10.10s' % convert_to_dollar(recs[2])
    end
    tran_paid = '%10.10s' % convert_to_dollar(recs[4])

    puts "     #{tran_typ}      #{tran_coin_id} #{tran_coin} #{tran_date}  #{tran_sold_for} #{tran_paid}"
  end
  puts

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
      purchase_price INT,
      sale_price INT,
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
      price INT,
      coll_id INT,
      FOREIGN KEY (coll_id) REFERENCES collection(id)
    )
    SQL

  db.execute(create_table_coins) 
  db.execute(create_table_grades)
  db.execute(create_table_collection)
  db.execute(create_table_trans)

end


def insert_defaults(db)

  insert_default_coins = <<-SQL
    INSERT INTO coins VALUES 
    (null, "Penny"), (null, "Nickel"), 
    (null, "Dime"), (null, "Quarter"), 
    (null, "Half Dollar"), (null, "Silver Dollar")
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

  db.execute(insert_default_coins)
  db.execute(insert_default_grades)

end

def display_grades(db, valid_grades, r_indent)
  grade_types = db.execute("SELECT * FROM grades")
  grade_types.each do |grade|
    valid_grades << grade[0]
    puts r_indent + grade[0].to_s + "." + grade[2].to_s
  end
end

def display_coins(db, valid_coins, r_indent)
  coin_types = db.execute("SELECT * FROM coins")
  coin_types.each do |coin|
    valid_coins << coin[0]
    puts r_indent + coin.join(".")
  end
end

def delete_from_collection(db, id, current)
  del_price = 0
  
  db.execute("INSERT INTO coin_trans (tran_date, tran_type, price, coll_id) VALUES (?,?,?,?)", [current.to_s, 'Del', del_price.to_i, id])

  db.execute("UPDATE collection SET status = 'D' WHERE id = ? ", [id])

end

def modify_collection(db, id)
  print "Do you want to modify the (y)ear, (g)rade or (p)rice paid for the coin? "
  response_modify = gets.chomp.downcase

  case response_modify
    when 'y'
      modify_collection_year(db, id)

    when 'g'
      modify_collection_grade(db, id)

    when 'p'
      modify_collection_price(db, id)

    else
        print "Invalid entry "
        get.chomp
  end

end

def modify_collection_year(db, id)
    print "What is the new year (yyyy)? "
    response_update_year = gets.chomp.to_i 
    db.execute("UPDATE collection SET year = (?) WHERE id = (?)",[response_update_year, id])
end

def modify_collection_grade(db, id)
    valid_grades = []
    r_indent = " " * 26
    response_update_condition = 0

    display_grades(db, valid_grades, r_indent)

    until valid_grades.include?(response_update_condition)
      puts
      print "Enter the number of the condition of the coin: "
      response_update_condition = gets.chomp.to_i
    end 

    db.execute("UPDATE collection SET condition = (?) WHERE id = (?) ",[response_update_condition, id])
end

def modify_collection_price(db, id)
    print "Enter the purchase price (0.00): "
    response_update_price = (gets.chomp.to_f * 100).to_i

    db.execute("UPDATE collection SET purchase_price = (?) WHERE id = (?) ",[response_update_price, id])
end

########## DRIVER CODE ##########
# Add coins ----------
  # Prompt user for corresponding db entries
  # Validate answers
  # Insert into collections
  # Insert into coin_trans
# SELL Coins ----------
  # Display collection
  # Select coin to sell
  # Enter price of coin
  # Set status in collection to "S"old
  # Update transaction table with results

require 'sqlite3'
require 'date'
current = Date.today

# create SQLite3 database
db = SQLite3::Database.new("coins.db")

create_tables(db)
insert_defaults(db)


loop do

  screen = 0

  while (screen < 1) || (screen > 6)
    main_heading
    print "Pick a screen > "
    screen = gets.chomp.to_i
  end


  coin_string = String.new
  valid_coins = []
  valid_grades = []
  r_indent = " " * 26
  response_add_coin_type = 0
  response_add_condition = 0


# Begin ADD to collection -----------
  if screen == 1 
    add_coin_heading

    display_coins(db, valid_coins, r_indent)

    until valid_coins.include?(response_add_coin_type)
      puts 
      print "Enter the number of the coin type you're adding to collection: "
      response_add_coin_type = gets.chomp.to_i
    end
    
    print "Enter the year of the coin (yyyy): "
    response_add_year = gets.chomp.to_i  
    puts

    display_grades(db, valid_grades, r_indent)

    until valid_grades.include?(response_add_condition)
      puts
      print "Enter the number of the condition of the coin: "
      response_add_condition = gets.chomp.to_i
    end 

    print "Enter the purchase price (0.00): "
    response_add_price = (gets.chomp.to_f * 100).to_i

    print "Do you want to add this to your collection (y/n)? "
    response_confirm_add = gets.chomp.downcase == 'y'

    if response_confirm_add
        db.execute("INSERT INTO collection (coin_id, year, condition, purchase_price, sale_price, status) VALUES (?,?,?,?,?,?)", [response_add_coin_type, response_add_year, response_add_condition, response_add_price, 0, "A"])

        prim_key = db.execute("SELECT last_insert_rowid()")

        db.execute("INSERT INTO coin_trans (tran_date, tran_type, price, coll_id) VALUES (?,?,?,?)", [current.to_s, "Add", response_add_price, prim_key])
    end
  end
# End ADD to collection -------------------

# Begin SELL from collection --------------
  if screen == 2
    sell_coin_heading
    puts
    valid_coins = view_collection(db)

    print "Which Coin would you like to sell, press <enter> to exit? "
    response_sell_coin = gets.chomp.to_i

    if valid_coins.include?(response_sell_coin)
      print "Sale price? "
      response_sell_price = (gets.chomp.to_f * 100).to_i

      db.execute("UPDATE collection SET status = 'S' WHERE id = ?",[response_sell_coin])

      db.execute("INSERT INTO coin_trans (tran_date, tran_type, price, coll_id) VALUES (?,?,?,?)", [current.to_s, "Sold", response_sell_price, response_sell_coin])

    end
  end

# Begin VIEW from collection ---------------
  if screen == 3
    view_coin_heading
    view_collection(db)
    print "Press <enter> to continue > "
    x = gets.chomp

  end

# Begin VIEW from transactions -------------
  if screen == 4
    view_coin_trans
    view_transactions(db)
    print "Press <enter> to continue > "
    gets.chomp

  end

  if screen == 5
    loop do
      view_coin_heading
      valid_coins = view_collection(db)
      print "Enter the id number of coin to update or press <enter> to return to menu > "
      coin_selected = gets.chomp.to_i

      if valid_coins.include?(coin_selected)
          print "Do you want to (m)odify or (d)elete the coin? "
          response_m_or_d = gets.chomp

          if response_m_or_d.downcase == "m"
              modify_collection(db, coin_selected)
          elsif response_m_or_d.downcase == "d"
              print "Do you want to delete this to your collection (y/n)? "
              response_confirm_delete = gets.chomp.downcase == 'y'

              if response_confirm_delete 
                  delete_from_collection(db, coin_selected, current)
              end
          end
      elsif coin_selected == 0
          break
      else
          print "You entered an invalid number.  Press <enter> to continue."
          gets.chomp
      end
    end

  end

# Quit -------------------
  if screen == 6
    break
  end

end














