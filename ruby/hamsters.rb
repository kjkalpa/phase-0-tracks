puts "What is the hamster's name"
h_name = gets.chomp
puts "How would you rate your level of sleeping (1 to 10)"
volume = gets.chomp
puts "Fur Color"
fur = gets.chomp
puts "Is the hamster a good candidate for adoption (y/n)"
candidate = gets.chomp
puts "Estimated age"
age = gets.chomp

if age == ""
  age = nil
end

