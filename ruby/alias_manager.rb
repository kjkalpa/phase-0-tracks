
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
kk="kyria kalpa".split(' ').reverse.join(' ').split('')

p kk

kk.each do |letter|
  tmp=letter.next[0]
  if vowels.include?(letter.upcase)
    until vowels.include?(tmp.upcase)
      puts "#{letter} It's a vowel           Next letter is #{tmp}"
      tmp=tmp.next[0]
    end
  else
    while vowels.include?(tmp.upcase)
      puts "#{letter} It's NOT a vowel       Next letter is #{tmp}"
      tmp=tmp.next[0]
    end
  end
end
