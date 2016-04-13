def encrypt (phrase)
=begin
Encrypt Method:
Take string input from user 
Index through string through length of the string
Move one letter forward in the alphabet for each letter in the string
Ignore spaces 
Do something with Z
print encrypted word
=end

  for x in 0...phrase.length
    if phrase[x] == " "
      print " "
    else
      print phrase[x].next[0]
    end
  end
end



print "Enter a word to encrypt: "
word = gets.chomp

encrypt word
