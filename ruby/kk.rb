letters = ["a", "b", "c", "d", "e"]
new_letters = []

puts "Original data: "
p letters
p new_letters


letters.each do |letter|
  new_letters << letter.next
end

puts "After .each call:"
p letters
p new_letters


numbers = {1 => 'one', 2 => 'two', 3 => 'three'}

numbers.each do |digit, word| 
  puts "#{digit} is spelled out as #{word}"
end





