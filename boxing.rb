# This is a functional game/simulator that simulates fighting between any number of fighters
# The user can create fughters with dfferent health levels, power levels, stamina, etc,
# and let the simulator run. The user then can see which fighters become victorious.

require 'pry'

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
    @initial_power = power
  end
  def to_string
    puts "*** #{@name} ***"
    puts "health: #{@health * 100 / @initial_health}%"
    puts "stamina: #{stamina}"
    puts "power: #{@initial_power}"
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
  fighters = []
  for i in 1..number
    fighters << {runner: generate_fighter("runner #{i}", initial_health, "Runner"), viking: generate_fighter("viking #{i}", initial_health, "Viking")}
  end
  return fighters
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

def battle(initial_health, number_of_fighting_pairs)
  fighters = generate_fighters(number_of_fighting_pairs, initial_health)

  fighters.map do |fighting_pair|
    my_runner = fighting_pair[:runner]
    my_viking = fighting_pair[:viking]
    my_runner.visualize
    my_viking.visualize
  end
  gets
  key = "start"
  timer = 0
  while key != "end"
    fighters.map! do |fighting_pair|
      my_runner = fighting_pair[:runner]
      my_viking = fighting_pair[:viking]
      attack(my_runner, my_viking, timer)
      attack(my_viking, my_runner, timer)
      {runner: my_runner, viking: my_viking}
    end
    fighters.map do |fighting_pair|
      my_runner = fighting_pair[:runner]
      my_viking = fighting_pair[:viking]
      my_runner.visualize
      my_viking.visualize
    end
    key = gets.chomp.to_s
    timer += 1
  end
  return fighters
end

def battle_statistics(fighters)
  number_runners_alive = 0
  number_vikings_alive = 0
  fighters.map do |fighting_pair|
    my_runner = fighting_pair[:runner]
    my_viking = fighting_pair[:viking]
    if my_runner.is_dead == false
      number_runners_alive += 1
    end
    if my_viking.is_dead == false
      number_vikings_alive +=1
    end
  end
  puts "number of runners still standing: #{number_runners_alive}"
  puts "number of vikings still standing: #{number_vikings_alive}"
  gets
  puts "Victorious RUNNERS:"
  fighters.map do |fighting_pair|
    my_runner = fighting_pair[:runner]
    if my_runner.is_dead == false
      my_runner.to_string
    end
  end
  gets
  puts "Victorious VIKINGS:"
  fighters.map do |fighting_pair|
    my_viking = fighting_pair[:viking]
    if my_viking.is_dead == false
      my_viking.to_string
    end
  end
end

fighters = battle(5000, 10)
battle_statistics(fighters)


