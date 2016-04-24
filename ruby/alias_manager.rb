
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


vowels="AEIOU"
agent_list = Hash.new

print "Enter the name you wish to scramble. Type 'quit' to end: "
answer = gets.chomp

until answer.downcase == "quit"

  #puts "Original name #{answer}"
  name = answer.split(' ').reverse.join(' ').split('')

  name.map! do |letter|
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

  name = name.join('')

  agent_list[:"#{answer}"] = "#{name}"

  #puts "scrambled name #{name}"

  print "Enter the name you wish to scramble. Type 'quit' to end: "
  answer = gets.chomp

end

agent_list.each {|secret_name, agent_name| puts "#{agent_name} is actually #{secret_name}"}




