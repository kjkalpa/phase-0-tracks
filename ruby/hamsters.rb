h_name = ""
while h_name == "" do 
  puts "What is the hamster's name"
  h_name = gets.chomp
end


vol_check = 0
while vol_check < 1 || vol_check > 10 
  puts "How would you rate your level of sleeping (1 to 10)"
  volume = gets.chomp
  vol_check = volume.to_i
end


puts "Fur Color"
fur = gets.chomp
puts "Is the hamster a good candidate for adoption (y/n)"
candidate = gets.chomp

puts "Estimated age"
age = gets.chomp

if age == ""
  age = nil
end

