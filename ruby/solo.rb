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
    puts "#{name} a French clown and stuck in a box"
    puts " --"
    puts "|  |"
    puts " --"
  end

  def pile_in_car
    puts "#{name} gets into car"
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
          puts "  Clown's new shoe size is #{@shoe_size}"
      end
    elsif shoe_size > 30
      puts "----- Now those are some great floppy clown shoes!!!!"
    else
      puts "----- That's a decent shoe size for a clown."
    end
  end

end

clown1 = Clown.new("Bozo", "Red", "Pins", 18)
clown1.shoe_remark(clown1.shoe_size)

clown1.juggle(clown1.name, clown1.prop) 
clown1.prop = "Chain saws"
clown1.juggle(clown1.name, clown1.prop)
clown1.mime
clown1.pile_in_car
puts clown1













