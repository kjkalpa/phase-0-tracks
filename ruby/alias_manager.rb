
=begin
Take name 
Swap first and last name
  Split name(string) at space 
  Create a new array with two items in it (first and last name)
  Reverse the order of the name
  Create a name again(string)

Cycle through all the letters of the name and substitute the next letter 
alphabet.
  Check if current letter is a vowel
    If it is then loop through next letters until next letter is a vowel

    If it isn't (ELSE) then loop through next letters until next letter is a consonant

  Assign letter selected to array
=end  


vowels="AEIOU"

kk = "Bizou Sioux Zoolander"
kk = 'Felicia Torrez'
p kk
kk = kk.split(' ').reverse.join(' ').split('')

kk.map! do |letter|
  next_letter=letter.next[0]
  if vowels.include?(letter.upcase)
    until vowels.include?(next_letter.upcase)
      next_letter=next_letter.next[0]
    end
  else
    while vowels.include?(next_letter.upcase)
      next_letter=next_letter.next[0]
    end
  end
  if next_letter == "!"
    letter = " "
  else
    letter=next_letter
  end
end

puts kk.join('')
