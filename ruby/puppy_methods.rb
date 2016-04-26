class Puppy

  def initialize
    puts "Initializing new puppy instance..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(integer)
    puts "Woof!" * integer
    integer
  end

  def roll_over
    puts "*rolls over*"
  end

  def dog_years(age)
    age = age * 7
  end 

  def shake
    puts "*gives paw*"
  end

end

lily = Puppy.new
lily.fetch("ball")
lily.speak(3)
lily.roll_over
puts lily.dog_years(4)
lily.shake

class Baseball_Player

  def initialize
    puts "Initializing Baseball Player instance..."
  end

  def throw(position)
    puts "I'm throwing the ball to #{position}"
    position
  end

  def catch
    puts "I'm catching the baseball"
  end

  def hit(pitch)
    puts "The player hit the #{pitch} out of the park!"
    pitch
  end
end


first_baseman = Baseball_Player.new
first_baseman.throw("second base")
first_baseman.catch
first_baseman.hit("curveball")

ball_players = Array.new


50.times do 
  second_baseman = Baseball_Player.new
  ball_players << second_baseman
end
p ball_players

ball_players.each do |player|
  player.catch 
  player.throw("home")
  player.hit("fastball")
end