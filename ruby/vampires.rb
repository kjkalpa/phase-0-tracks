puts "What is your name?"
name=gets.chomp
puts "How old are you?"
age=gets.chomp
puts "What year were you born in?"
year=gets.chomp
puts "Our company cafeteria serves garlic bread. Should we order some for you?(y/n)"
garlic=gets.chomp
puts "Would you like to enroll in the company's health insurance?(y/n)"
insurance=gets.chomp

age.to_i!
year.to_i!
garlic.downcase!

