module Shout
  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yelling_happily(words)
    words + " :)"
  end

end


class Car_driver
  include Shout
end

class Angry_birds
  include Shout
end


# puts x = Shout.yelling_happily("Yes this worked ")

driver = Car_driver.new
bird = Angry_birds.new

puts bird.yell_angrily("We're going to get you pigs")
puts bird.yelling_happily("Yeah we knocked you down.")

puts driver.yell_angrily("Get off the road you slow poke")
puts driver.yelling_happily("Wow, I94 has no traffic.")

