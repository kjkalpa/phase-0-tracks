clear_code = %x{clear}  #"\e[H\e[2J"

h_name = ""
while h_name == "" do 
  puts "What is the hamster's name?"
  h_name = gets.chomp
end

vol_check = 0
until vol_check >= 1 && vol_check <= 10 
  puts "How would you rate your level of sleeping? (1 to 10)"
  volume = gets.chomp
  volume.upcase!
  vol_check = volume.to_i
  p volume
end

fur = ""
while fur == ""
  puts "Fur Color"
  fur = gets.chomp
end

candidate = ""
while candidate.downcase != "y" && candidate.downcase != "n"
  puts "Is the hamster a good candidate for adoption? (y/n)"
  candidate = gets.chomp
  candidate.downcase! 
end 

puts "Estimated age?"
age = gets.chomp

if age == ""
  age = nil
else 
  age = age.to_i
  p age
end

print clear_code

puts "Your hamster's name is #{h_name}!"
puts "You rated your level of sleeping as a #{vol_check}"
puts "Your hamster is #{fur}"
if candidate == "y"
  puts "Your hamster is a good candidate for adoption"
else
  puts "Your hamster is a poor candidate for adoption"
end

if age == nil
  puts "We don't know the hamster's age."
else
  puts "Your hamster is #{age} years old!"
end


