# Find year using system date
require "date"
currentDate = DateTime.now

puts "How many employees will be processed?"
s_emp = gets.chomp
i_emp = s_emp.to_i

for i_loop in 1..i_emp

  puts "What is your name?"
  name=gets.chomp
  puts "How old are you?"
  age=gets.chomp
  puts "What year were you born in?"
  year=gets.chomp
  puts "Our company cafeteria serves garlic bread. Should we order some for you?(y/n)"
  garlic=gets.chomp
  puts "Would you like to enroll in the company's health insurance?(y/n)"
  insurance=gets.chomp

  # Determine actual age (close enough)
  v_age = currentDate.year - year.to_i
  age_right = v_age == age.to_i

  # Set likes_garlic boolean
  if garlic.downcase == "y" 
    likes_garlic = true
  else
    likes_garlic = false
  end

  # Set wants_insurance boolean
  if insurance.downcase == "y"
    wants_insurance = true
  else
    wants_insurance = false
  end

  v_result = "Results inconclusive."

  if age_right && (likes_garlic || wants_insurance)
    v_result = "Probably not a vampire."
  elsif !age_right && (!likes_garlic || !wants_insurance)
    v_result = "Probably a vampire."
  elsif !age_right && !likes_garlic && !wants_insurance 
    v_result = "Almost certainly a vampire."
  end

  if name.downcase == "drake cula" || name.downcase == "tu fang"
    v_result = "Definitely a vampire."
  end

  allergy_cnt = 0
  allergies = ""
  puts "List your allergies one at a time.  Type 'done' when finished"
  
  until allergies.downcase == "done" 
    allergy_cnt += 1
    print "#{allergy_cnt}. "
    allergies = gets.chomp
    if allergies.downcase == "sunshine"
      v_result = "Probably a vampire."
    end
  end
  
  puts "Is #{name} a vampire: #{v_result}"

end

print "Actually, never mind! What do these questions have to do with anything? Let's all be friends."

