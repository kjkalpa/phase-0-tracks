def test_method
  puts "This is a test message for practice."
  yield
  yield("adam","eve")
end

test_method {|name1, name2| puts "message received #{name1} and #{name2}."}


grocery_list = ["eggs", "milk", "cheese", "butter"]
p grocery_list

puts ".each on an array"
grocery_list.each do |item|
  puts item
end

puts ".map on an array"
grocery_list.map! do |item|
  puts item
  item.upcase
end
p grocery_list

car_list = {
  chevy: "corvette",
  honda: "civic",
  ford:  "focus"
}
p car_list

puts ".each on a hash"
car_list.each do |make, model|
  puts "#{model} is made by #{make}."
end

puts "arrays number one - used delete_if method"
#number1 arrays
number_list = [1,2,3,4,5,6,7,8,9,10]
p number_list
number_list.delete_if{|num|num > 5}
p number_list

puts "arrays number two - used select! method"
#number2 arrays
number_list = [1,2,3,4,5,6,7,8,9,10]
p number_list
number_list.select! { |num|num.even? }
p number_list

puts "arrays number three - used reject! method"
#number3 arrays
number_list = [1,2,3,4,5,6,7,8,9,10]
p number_list
number_list.reject! {|num|num < 6}
p number_list

puts "arrays number four - used keep_if method"
#number4 arrays
number_list = [1,2,3,4,5,6,7,8,9,10]
p number_list
number_list.keep_if {|num|num < 5}
p number_list

puts "hash number one - used delete_if method"
#number1 hash
number_hash = {
  a: 10,
  b: 20,
  c: 30,
  d: 40,
  e: 50,
  f: 60
}

p number_hash
number_hash.delete_if{|key, value| key >= :c}
p number_hash

puts "hash number two - used select! method"
#number2 hash

number_hash = {
  a: 10,
  b: 20,
  c: 30,
  d: 40,
  e: 50,
  f: 60
}

p number_hash
number_hash.select!{|key, value| value > 50}
p number_hash

puts "hash number three - used reject! method"
#number3 hash

number_hash = {
  a: 10,
  b: 20,
  c: 30,
  d: 40,
  e: 50,
  f: 60
}

p number_hash
number_hash.reject!{|key, value| value > 50}
p number_hash

puts "hash number four - used keep_if method"
#number4 hash

number_hash = {
  a: 10,
  b: 20,
  c: 30,
  d: 40,
  e: 50,
  f: 60
}

p number_hash
number_hash.keep_if{|key, value| value == 50}
p number_hash