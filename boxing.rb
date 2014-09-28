require 'pry'
# puts generate_fighters(10)[:runners][3].to_string  hang@generalassemb.ly or ga.co

class Fighter
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
    puts "#{@name}"
    puts "health: #{@health}"
    puts "stamina: #{stamina}"
    puts "power: #{@power}"
    puts @is_tired ? "tired" : "not tired"
    puts @is_dead ? "dead" : "alive"
  end
  def visualize
    health_level = @health * 100 / @initial_health
    stars = "*" * health_level
    spaces = " " * (100 - stars.length)
    @is_tired == true ? tired_or_not = "tired" : tired_or_not = "not_tired"
    @is_dead == true ? dead_or_alive = "dead" : dead_or_alive = "alive"
    puts "#{@name} #{stars}#{spaces} #{tired_or_not} #{dead_or_alive}"
  end
end

def generate_fighter(name, initial_health, type)
  if type == "Runner"
    Fighter.new(name, initial_health, rand(200..300), rand(20..50))
  elsif type == "Viking"
    Fighter.new(name, initial_health, rand(1..50), rand(50..100))
  else
    puts "check fighter type..."
  end
end

def generate_fighters(number, initial_health)
  runners = []
  vikings = []
  for i in 1..number
    runners << generate_fighter("runner #{i}", initial_health, "Runner")
    vikings << generate_fighter("viking #{i}", initial_health, "Viking")
  end
  fighters = {runners: runners, vikings: vikings}
end

def attack(offender, defender, fight_time)
  if defender.health > 0 && offender.is_dead == false
    defender.health = defender.health - offender.power
    if defender.health < 0
      defender.health = 0
    end
  elsif defender.health > 0 && offender.is_dead == true
    nil
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
fighters = generate_fighters(10, initial_health)
runners = fighters[:runners]
vikings = fighters[:vikings]

runner = runners[1]
viking = vikings[1]

# initial_health = 5000
# runner = generate_fighter("runner", initial_health, "Runner")
# viking = generate_fighter("viking", initial_health, "Viking")
# runner.to_string
# viking.to_string

puts "START FIGHT!!!!"

key = "start"
timer = 0
while key != "end" do
  attack(runner, viking, timer)
  attack(viking, runner, timer)
  runner.visualize
  viking.visualize
  key = gets.chomp.to_s
  timer += 1
end
