vowels="aeiou"
agent_list = Hash.new
new_name = []

answer ="Felicia Torrez"

name = answer.split(' ').reverse.join(' ').split('')

p name


name.each do |letter|
  is_vowel = vowels.include?(letter.downcase)
  #puts "Current Letter #{letter} and next letter is #{letter.next[0]}"
  next_letter = letter.next[0]
  if #letter is a vowel
    #until loop
    #then loop thru the letters until next_letter is a vowel
    #next_letter = next_letter.next[0]
  else
     #while loop 
     #is not a vowel
     #then loop thru untii the next letter is not a vowel
  end

  # add  next_ letter to your new index << 

end
  
p new_name