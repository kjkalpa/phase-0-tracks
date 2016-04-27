# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # take a single string and break it up into an array
  # set default quantity 1
  # Create hash with as the array as the key and the quantity as the value.
  # print the list to the console [can you use one of your other methods here?]
# output: A hash based on the input string, with the number of each item as the value.

# Method to add an item to a list
# input: hash name, item name and optional quantity
# steps: Add item and quantity to hash
# output: Updated hash.

# Method to remove an item from the list
# input: hash name and item
# steps: remove item from hash table
# output: Updated hash

# Method to update the quantity of an item
# input: hash name, item and qty
# steps: Find the key in the hash
# steps: update the value of the key
# output: Updated hash

# Method to print a list and make it look pretty
# input: hash name
# steps: iteration over hash
# output: Display the hash as value then a key.

def create_list(grocery_list)
  grocery_hash = Hash.new
  grocery_array = grocery_list.split(' ')
  grocery_array.each do |x|
    grocery_hash[x] = 1
  end
  return grocery_hash
end

def add_item(hash_name, item, qty=1)
  # if qty.class == Array 
  #   hash_name[item] = 1
  # else 
  #   hash_name[item] = qty
  # end
  hash_name[item] = qty
  hash_name
end

def remove_item(hash_name, item)
  hash_name.delete(item)
  hash_name
end

def update_item(hash_name, item, qty)
  hash_name[item] = qty
  hash_name
end

def print_list(hash_name)
  puts "grocery list:"
  hash_name.each do |item, qty|
    puts "#{qty} #{item}"
  end
end
#### DRIVER CODE
p katys_list = create_list("icecream cookies chocolate")
p katys_list = add_item(katys_list, "brownies", 7)
p katys_list = add_item(katys_list, "apples")
p katys_list = remove_item(katys_list, "cookies")
p katys_list = update_item(katys_list, "brownies", 3)
print_list(katys_list)
puts "----------------------------------------------"
p new_list = create_list("Cucumbers Lettuce Green_Peppers")
p new_list = add_item(new_list, "Lemonade", 2)
p new_list = add_item(new_list, "Tomatoes", 3)
p new_list = add_item(new_list, "Onions", 1)
p new_list = add_item(new_list, "Ice_Cream", 4)
p new_list = remove_item(new_list, "Lemonade")
p new_list = update_item(new_list, "Ice_Cream",1)
puts "----------------------------------------------"
print_list(new_list)













