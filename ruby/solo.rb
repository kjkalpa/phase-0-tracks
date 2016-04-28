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

end















