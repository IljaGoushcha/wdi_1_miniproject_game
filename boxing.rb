require 'pry'
# puts generate_fighters(10)[:runners][3].to_string  hang@generalassemb.ly or ga.co

class Runner
  attr_accessor(:name, :health, :stamina, :power)
  def initialize(name, health, stamina, power)
    @name = name
    @health = health
    @stamina = stamina
    @power = power
  end
  def to_string
    puts "Runner: " + @name
    puts "health: #{@health}"
    puts "stamina: #{stamina}"
    puts "power: #{@power}"
  end
end

class Viking
  attr_accessor(:name, :health, :stamina, :power)
  def initialize(name, health, stamina, power)
    @name = name
    @health = health
    @stamina = stamina
    @power = power
  end
  def to_string
    puts "Viking: " + @name
    puts "health: #{@health}"
    puts "stamina: #{stamina}"
    puts "power: #{@power}"
  end
end

def generate_runner(name, health)
  Runner.new(name, health, rand(50..100), rand(1..50))
end

def generate_viking(name, health)
  Viking.new(name, health, rand(1..50), rand(50..100))
end

def generate_fighters(number)
  runners = []
  vikings = []
  for i in 1..number
    runners << generate_runner(i.to_s)
    vikings << generate_viking(i.to_s)
  end
  fighters = {runners: runners, viking: vikings}
end

def attack(offender, defender)

end
puts generate_runner("Oleg", 10000).to_string

# puts generate_fighters(10)[:runners].length.to_s
# puts generate_fighters(10)[:runners][3].to_string

