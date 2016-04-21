#Create the hash table
client_info = Hash.new
#Prompt the designer/user for all of this information.
print "What is the client's name? "
name       = gets.chomp
print "What is #{name}'s age? "
age        = gets.chomp.to_i
print "How many children does #{name} have? "
children   = gets.chomp.to_i
print "What theme does #{name} like? "
theme      = gets.chomp
print "What color does #{name} love? "
color_love = gets.chomp
print "What color does #{name} hate? "
color_hate = gets.chomp
print "What's the clients budget? "
budget     = gets.chomp.to_i
print "What decade does #{name} love?  "
decade     = gets.chomp

system "clear"

#Convert any user input to the appropriate data type.
#Add to hash table
client_info = {name: name, age: age, children: children, theme: theme, loves_color: color_love, hates_color: color_hate, decade: decade}
#Print the hash back out to the screen when the designer has answered all of the questions.
client_info.each {|key, value| puts "#{key}: #{value}" }

#Give the user the opportunity to update a key (no need to loop, once is fine). 
# => After all, sometimes users make mistakes! If the designer says "none", skip it. 
# => But if the designer enters "decor_theme" (for example), your program should ask 
# => for a new value and update the :decor_theme key. (Hint: Strings have methods that 
# => will turn them into symbols, which would be quite handy here.) 
# => You can assume the user will correctly input a key that exists in your hash -- no need to handle user errors.

puts " " 
puts " " 
puts "Your keys and answers have printed above."
puts "Are there any answers you wish to change?"
puts "Type 'none' to finish or the key name to change it."
change_key = gets.chomp.downcase

#If answer is not none then perform change
#If key to change is one of the integers then accept an integer
#Make sure key to change is indeed one of the keys
#Print the latest version of the hash, and exit the program.






