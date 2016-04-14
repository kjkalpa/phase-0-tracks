# Find year using system date
require "date"
current = DateTime.now

print "How many employees will be processed? "
i_emp = gets.chomp.to_i

for i in 1..i_emp 
  print "What is your name? "
  name = gets.chomp
  print "How old are you? "
  age = gets.chomp.to_i
  print "What year were you born? "
  year_born = gets.chomp.to_i
  print "Our company cafeteria serves garlic bread.  Should we order some for you? (y/n) "
  garlic_response = gets.chomp.downcase
  print "Would you like to enroll in the company's health insurance? (y/n) "
  insurance_response = gets.chomp.downcase

  garlic_answer = garlic_response == "y"
  insurance_answer = insurance_response == "y"
  age_answer = current.year - year_born == age

  if name.downcase == "drake cula" || name.downcase == "tu fang"
    result = "Definitely a vampire."
  elsif !age_answer && !garlic_answer && !insurance_answer
    result = "Almost certainly a vampire."
  elsif !age_answer && (!garlic_answer || !insurance_answer)
    result = "Probably a vampire."
  elsif age_answer && (garlic_answer || insurance_answer)
    result = "Probably not a vampire."
  else
    result = "Results inconclusive."
  end

  allergy_cnt = 0
  allergies = ""
  puts "List your allergies one at a time.  Type 'done' when finished"
  
  until allergies.downcase == "done" 
    allergy_cnt += 1
    print "#{allergy_cnt}. "
    allergies = gets.chomp
    if allergies.downcase == "sunshine"
      result = "Probably a vampire."
    end
  end

  puts "Results are in for #{name}.... #{result}"
end

print "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
