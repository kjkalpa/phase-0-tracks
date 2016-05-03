class Dancer
  attr_reader :name, :age
  attr_accessor  :age, :card

  def initialize(name, age)
    @name = name
    @age = age
    @card = []
  end
  def pirouette
    puts "*twirls*"
    x="*twirls*"
    x
  end
  def bow
    puts "*bows*"
  end
  def queue_dance_with(partner)
    @card = card << partner
  end
  def begin_next_dance
    puts "now dancing with #{@card.shift}"
  end
  #find out if the dancer is tired and if the dancer is clear the dancer's dance que
  def tired
    if @card.length > 7
      puts "i'm too tired to dance anymore"
      @card = @card.clear
    else
      puts "ready to keep going with #{@card[0]}"
    end
  end
end

describe Dancer do
  let(:dancer) {Dancer.new("Misty Copeland", 33)}
  it "has a readable name" do
    expect(dancer.name).to eq "Misty Copeland"
  end
  it "has a readable age" do
    expect(dancer.age).to eq 33
  end
  it "has a writeable age" do
    dancer.age = 34
    expect(dancer.age).to eq 34
  end 
end