name = "FeliciA Torres".split(' ').reverse.join(' ').split('')
vowels = "aeiou"
p name

name.map! do |letter|
  is_vowel = vowels.include?(letter.downcase)
  next_letter = letter.next[0]
  
  until vowels.include?(next_letter.downcase) == is_vowel
    next_letter = next_letter.next[0]
  end
  if letter == " "
    letter = " "
  else
    letter = next_letter
  end
end
  
p name.join('')