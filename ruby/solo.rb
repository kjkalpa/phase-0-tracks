# Clown class
#   Attributes
#     Name - string
#     Hair color - string
#     Juggling_prop - string
#     Shoe size - integer

#   Methods
#     Juggle: input - prop, name; output - message
#     Honk: output - honk his horn
#     Mime: input - name; output - box & message
#     Pile_in_car - name; output - list of attributes getting into car
#     Shoe_Remark - 



class Clown
  attr_reader   :shoe_size, :name
  attr_accessor   :prop, :hair_color

  def initialize(name, hair_color, prop, shoe_size)
    @name = name
    @hair_color = hair_color
    @prop = prop
    @shoe_size = shoe_size
  end

  def juggle(name, prop)
    puts "#{name} is juggling #{prop}"
  end

  def honk
    puts "honk honk honk honk"
  end

  def mime
    puts "#{name} is now a mime and stuck in a box"
    puts " --"
    puts "|  |"
    puts " --"
  end

  def pile_in_car
    puts "   ... #{name} gets into car"
  end

  def exit_car
    puts "Now exiting the car is #{name}. He has #{hair_color} hair, juggles #{prop} and wears size #{shoe_size} shoes.  "
  end

  def shoe_remark(shoe_size)
    if shoe_size <= 18
      puts "----- Those are small shoes for a clown"
      print "----- Would you like some larger shoes (y/n)? "
      shoe_answer = gets.chomp
      if shoe_answer.downcase == "y"
          print "Enter a new shoe size: " 
          new_shoe_size = gets.chomp.to_i
          @shoe_size = new_shoe_size
          puts "#{name}'s new shoe size is #{@shoe_size}"
      end
    elsif shoe_size > 30
      puts "----- Now those are some great floppy clown shoes!!!!"
    else
      puts "----- That's a decent shoe size for a clown."
    end
  end
end

#### DRIVER CODE
## Release 1
clown1 = Clown.new("Pierre", "Red", "Pins", 22)
#clown1.shoe_remark(clown1.shoe_size)
puts "Created a clown named #{clown1.name} he has #{clown1.hair_color} hair, he juggles #{clown1.prop} and wears size #{clown1.shoe_size} shoes.  "

clown1.juggle(clown1.name, clown1.prop) 
clown1.prop = "Chainsaws"
puts "#{clown1.name} has decided to switch props to #{clown1.prop}"
clown1.juggle(clown1.name, clown1.prop)
puts " "
clown1.mime
clown1.pile_in_car
puts " "

## Release 2
clown_index = 0
clowns = []
puts "Lets build some clowns!"
loop do 
  #p clown_index
  puts "Press <enter> to stop building clowns."
  print "Enter the clown's name? "
  clown_name = gets.chomp.to_s.capitalize
  if clown_name == ""
    break
  end
  print "Enter #{clown_name}'s hair color? "
  clown_hair = gets.chomp.to_s
  print "Enter #{clown_name}'s juggling prop? "
  clown_prop = gets.chomp.to_s
  print "Enter #{clown_name}'s shoe size? "
  clown_shoes = gets.chomp.to_i

  clowns << Clown.new(clown_name, clown_hair, clown_prop, clown_shoes)

  clowns[clown_index].shoe_remark(clown_shoes)
  clowns[clown_index].pile_in_car
  puts " "
 
  clown_index += 1
end

clown_index.times do |x|
  #p clowns[x]
  #puts "Now exiting the car is #{clowns[x].name}. He has #{clowns[x].hair_color} hair, juggles #{clowns[x].prop} and wears size #{clowns[x].shoe_size} shoes.  "
  clowns[x].exit_car
end

# Added after the assignment was turned in 
# but it should have looked like this:
# clowns.each {|clwn| clwn.exit_car} 














