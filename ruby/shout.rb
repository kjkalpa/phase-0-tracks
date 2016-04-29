module Shout
  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yelling_happily(words)
    words + ":)"
  end

end


class Angry_driver
  include Shout
end

class Angry_birds
  include Shout
end



# puts x = Shout.yelling_happily("Yes this worked ")

