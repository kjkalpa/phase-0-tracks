class Santa  
  attr_reader  :ethnicity
  attr_accessor :gender, :age

  def initialize(gender, ethnicity)
    #puts "Initializing Santa instance"
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
    #i = @reindeer_ranking.index(reindeer)
    @reindeer_ranking.delete(reindeer)
    @reindeer_ranking.push(reindeer)
  end

  # def gender=(new_gender)
  #   @gender =new_gender
  # end

  # def age
  #   @age
  # end

  # def ethnicity 
  #   @ethnicity
  # end

end

##### Driver Code
prng = Random.new

# Kris = Santa.new
# Kris.eat_milk_and_cookies("Chocolate Chip cookie")

santas = []

# example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_genders = ["Androgyne","Bigender","FTM","Gender Nonconforming","Intersex","MTF","Non-binary","Pangender"]

# example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
example_ethnicities = ["Eurasian", "European", "Black", "White", "Latino", "None of your business", "Asian", "Hawaiian"]

#example_genders.length.times do |i|
num_of_santas = 350

num_of_santas.times do |i|
  santas << Santa.new(example_genders.sample, example_ethnicities.sample)
  santas[i].age = prng.rand(0..140)
  puts "Santa # #{i+1} is a #{santas[i].gender}, #{santas[i].ethnicity}, #{santas[i].age} years old"
end
  
# p santas[0]
# ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
   
santas[0].gender ="No Gender"
p santas[0]

santas[0].get_mad_at("Prancer")
p santas[0]

santas[0].speak

santas[-1].celebrate_birthday
puts "---------------------"
puts "The last Santa's new age is #{santas[-1].age}"
puts "The last Sants's ethnicity is #{santas[-1].ethnicity}"
















