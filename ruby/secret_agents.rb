=begin
  Encrypt Method:
  Take string input from user 
  Create a new string to store encrypted word
  Index through string through length of the string
  Move one letter forward in the alphabet for each letter in the string
  Ignore spaces 
  Do something with Z
  store encrypted word
  print encrypted word
=end

def encrypt (phrase)
  encrypted_word = String.new
  for x in 0...phrase.length
    if phrase[x] == " "
      encrypted_word[x] = " "
    else
      encrypted_word[x] = phrase[x].next[0]
    end
  end
  return encrypted_word
end

#print "Enter a word to encrypt: "
#word = gets.chomp

#enc_word = encrypt word
#puts "#{enc_word}"

=begin
  Decrypt Method:
  Take string input from user
  Create a new string to store decryted word
  Create alphabet array 
  Index through string through length of the string
  Use that letter in our array to find the previous letter
  Exception: if letter is a, we need an if statement to output z
  Add letter to decrypted word
  store decrypted word
=end
def decrypt (phrase)
  decrypted_word = String.new
  abc_index = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  for x in 0...phrase.length
    if phrase[x] == " "
      decrypted_word[x] = " "
    else
      y_pos = abc_index.index(phrase[x])
      if y_pos == 0
        decrypted_word[x] = abc_index[25]
        #print abc_index[25]
      elsif y_pos == 26
        decrypted_word[x] = abc_index[51]
      else
        decrypted_word[x] = abc_index[y_pos-1]
        #print abc_index[y_pos-1]
      end
    end
  end
  return decrypted_word
end

#dec_word = decrypt(enc_word)
#puts "#{dec_word}"

decrypt(encrypt("swordfish"))
=begin 
  This nested method call works because it performs the innermost parenthesis
  and that returns a value and that value is the argument for the next 
  method.
=end

=begin
  Prompt the user for an option to encrypt or decrypt
  Ask user for the password
  Determine if they want to enc. or dec.
  Perform appropriate task
  Print to the screen
=end


choice = String.new
until choice == "encrypt" || choice == "decrypt"
  puts "Hey! Would you like to encrypt or decrypt your password? encrypt/decrypt"
  choice = gets.chomp
  choice.downcase!
end
puts "Please enter the password"
password = gets.chomp
if(choice == "encrypt")
  puts "Your encrypted password is:  #{encrypt password}"
else
  puts "Your decrypted password is:  #{decrypt password}"
end