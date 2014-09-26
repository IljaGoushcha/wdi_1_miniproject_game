class Boxer
  attr_accessor(:health, :power)
  def initialize(health, power)
    @health = health
    @power = power
  end
  def to_string
    puts "Boxer"
    puts "health: #{@health}"
    puts "power: #{@power}"
  end
end

class KickBoxer
  attr_accessor(:health, :power)
  def initialize(health, power)
    @health = health
    @power = power
  end
  def to_string
    puts "Kick-boxer"
    puts "health: #{@health}"
    puts "power: #{@power}"
  end
end

def generate_boxer
  Boxer.new(rand(50..100), rand(1..50))
end

def generate_kickboxer
  KickBoxer.new(rand(1..50), rand(50..100))
end

my_boxer = generate_boxer
my_boxer.to_string

my_kickboxer = generate_kickboxer
my_kickboxer.to_string

