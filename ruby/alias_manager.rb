
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
#Add loop to keep entering name until user hits quit


vowels="aeiou"
agent_list = Hash.new

print "Enter the name you wish to scramble. Type 'quit' to end: "
answer = gets.chomp

until answer.downcase == "quit"
  name = answer.split(' ').reverse.join(' ').split('')

#Check if letter is a vowel.  Vowel = true, not a vowel = false
#Get next letter and continue looping thru letters until statement is true.
#True for vowel, False for not a vowel
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

  name = name.join('')

  agent_list[:"#{answer}"] = "#{name}"

  #puts "scrambled name #{name}"

  print "Enter the name you wish to scramble. Type 'quit' to end: "
  answer = gets.chomp

end

agent_list.each {|secret_name, agent_name| puts "#{agent_name} is actually #{secret_name}"}




