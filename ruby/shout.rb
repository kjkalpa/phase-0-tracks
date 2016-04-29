module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yelling_happily(words)
    words + ":)"
  end

end


puts x = Shout.yelling_happily("Yes this worked ")