require 'pry'
# puts generate_fighters(10)[:runners][3].to_string  hang@generalassemb.ly or ga.co

class Runner
  attr_accessor :name, :health, :stamina, :power, :is_tired, :is_dead, :initial_health
  def initialize(name, health, stamina, power)
    @name = name
    @health = health
    @stamina = stamina
    @power = power
    @is_tired = false
    @is_dead = false
    @initial_health = health
  end
  def to_string
    puts "Runner: " + @name
    puts "health: #{@health}"
    puts "stamina: #{stamina}"
    puts "power: #{@power}"
    if @is_tired
      puts "tired"
    else
      puts "not tired"
    end
    if @is_dead
      puts "dead"
    else
      puts "alive"
    end
  end
  def visualize
    health_level = @health * 100 / @initial_health
    stars = "*" * health_level
    spaces = " " * (100 - stars.length)
    if @is_tired == true
      tired_or_not = "tired"
    else
      tired_or_not = "not_tired"
    end
    if @is_dead == true
      dead_or_alive = "dead"
    else
      dead_or_alive = "alive"
    end
    puts "Runner #{@name} #{stars}#{spaces} #{tired_or_not} #{dead_or_alive}"
  end
end

class Viking
  attr_accessor :name, :health, :stamina, :power, :is_tired, :is_dead, :initial_health
  def initialize(name, health, stamina, power)
    @name = name
    @health = health
    @stamina = stamina
    @power = power
    @is_tired = false
    @is_dead = false
    @initial_health = health
  end
  def to_string
    puts "Viking: " + @name
    puts "health: #{@health}"
    puts "stamina: #{stamina}"
    puts "power: #{@power}"
    if @is_tired
      puts "tired"
    else
      puts "not tired"
    end
    if @is_dead
      puts "dead"
    else
      puts "alive"
    end
  end
  def visualize
    health_level = @health * 100 / @initial_health
    stars = "*" * health_level
    spaces = " " * (100 - stars.length)
    if @is_tired == true
      tired_or_not = "tired"
    else
      tired_or_not = "not_tired"
    end
    if @is_dead == true
      dead_or_alive = "dead"
    else
      dead_or_alive = "alive"
    end
    puts "Viking #{@name} #{stars}#{spaces} #{tired_or_not} #{dead_or_alive}"
  end
end

def generate_runner(name, health)
  Runner.new(name, health, rand(200..300), rand(20..50))
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

def attack(offender, defender, fight_time)
  if defender.health > 0 && offender.is_dead == false
    defender.health = defender.health - offender.power
    if defender.health < 0
      defender.health = 0
    end
  elsif defender.health > 0 && offender.is_dead == true
  elsif
    defender.is_dead = true
    defender.health = 0
  end
  if fight_time > offender.stamina && offender.power > 1
    offender.power = offender.power - 1
    offender.is_tired = true
  end
  fighters = {offender: offender, defende: defender}
end



initial_health = 5000
oleg = generate_runner("Oleg", initial_health)
ilja = generate_viking("Ilja", initial_health)

puts "START FIGHT!!!!"

key = "start"
timer = 0
while key != "end" do
  attack(oleg, ilja, timer)
  attack(ilja, oleg, timer)
  oleg.visualize
  ilja.visualize
  key = gets.chomp.to_s
  timer += 1
end
