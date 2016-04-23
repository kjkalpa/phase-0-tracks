

restaurant_menu = {

  :"Appetizers" => [
    "Steamed Edamame", "Grilled Chicken Satays","Shrimp Summer Roll"
  ],
  :"Salads" => [
    "House Mixed Greens Salad","Chopped Chicken Salad","Farmer's market salad"
  ],
  :"Entrees" => [
    "Kung Pao Chicken", "Spicy Sichuan Beef","Ginger sea scallops"
  ],
  :"Desserts" => [
    "Cheese Cake", "Sweet Potato Pie", "Chocolate Cake"
  ]

  }



  def display_results(msg, array_)
    1.times { |x| puts " "}
    new_msg = msg + " --------- "
    puts new_msg
    puts " "
    puts array_
  end


  display_results("Entire nested loop", restaurant_menu)
  display_results("All the Hash keys",restaurant_menu.keys)
  display_results("Entrees list", restaurant_menu[:Entrees])
  display_results("Dessert list", restaurant_menu[:Desserts])
  display_results("Third item on Desserts", restaurant_menu[:Desserts][2])

  puts " "
  puts "Add Cherry Pie to dessert list"
  restaurant_menu[:Desserts].push("Cherry Pie")
  display_results("Dessert list", restaurant_menu[:Desserts])

  puts " "
  puts "Add Beverages to hash table"
  restaurant_menu[:"Beverages"]=["Soft Drinks","Beer","Alcohol"]
  display_results("All the Hash keys",restaurant_menu.keys)
  display_results("Beverages List",restaurant_menu[:Beverages])

  puts " "
  puts "Reverse order of Beverages"
  restaurant_menu[:Beverages].reverse!
  display_results("Beverages List",restaurant_menu[:Beverages])

