class Santa  
  def initialize(gender, ethnicity)
    puts "Initializing Santa instance"
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def speak 
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was good #{cookie}"
    cookie
  end

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer)
    i = @reindeer_ranking.index(reindeer)
    @reindeer_ranking.delete(reindeer)
    @reindeer_ranking.push(reindeer)
  end

  def gender=(new_gender)
    @gender =new_gender
  end

  def age
    @age
  end

  def ethnicity 
    @ethnicity
  end

end

# Kris = Santa.new
# Kris.eat_milk_and_cookies("Chocolate Chip cookie")

santas = []

# example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_genders = ["Androgyne","Bigender","FTM","Gender Nonconforming","Intersex","MTF","Non-binary","Pangender"]

# example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
example_ethnicities = ["Eurasian", "Klingon", "Black", "White", "Latino", "None of your business", "Asian", "Hawaiian"]

example_genders.length.times do |i|
  santas << Santa.new(example_genders[i], example_ethnicities[i])
end
  
santas[0].celebrate_birthday
p santas[0]

# ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
   
santas[0].get_mad_at("Prancer")
p santas[0]
santas[0].gender ="No Gender"
p santas[0]
p santas[0].age
p santas[0].ethnicity









