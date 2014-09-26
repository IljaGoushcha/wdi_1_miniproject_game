require 'pry'

class Warrior
  attr_accessor :name, :health, :endurance, :armor, :jab_damage, :cross_damage, :hook_damage, :uppercut_damage, :kick_damage
  def initialize(name, health, endurance, armor, jab_damage, cross_damage, hook_damage, uppercut_damage, kick_damage)
    @name = name
    @health = health
    @endurance = endurance
    @armor = armor
    @jab_damage = jab_damage
    @cross_damage = cross_damage
    @hook_damage = hook_damage
    @uppercut_damage = uppercut_damage
    @kick_damage = kick_damage
  end

  def jab
    @health = @health - jab_damage
  end
  def cross
    @health = @health - cross_damage
  end
  def hook
    @health = @health - hook_damage
  end
  def uppercut
    @health = @health - uppercut_damage
  end
  def kick
    @health = @health - uppercut_damage
  end
end

class Knight < Warrior
  attr_accessor :axe_damage
  def initialize(name, health, endurance, armor, jab_damage, cross_damage, hook_damage, uppercut_damage, kick_damage, axe_damage)
    super(name, health, endurance, armor, jab_damage, cross_damage, hook_damage, uppercut_damage, kick_damage)
    @axe_damage = axe_damage
  end
  def axe_hit
    @health = @health - axe_damage
  end
end

class Viking < Warrior
  attr_accessor :sword_damage
  def initialize(name, health, endurance, armor, jab_damage, cross_damage, hook_damage, uppercut_damage, kick_damage, sword_damage)
    super(name, health, endurance, armor, jab_damage, cross_damage, hook_damage, uppercut_damage, kick_damage)
    @sword_damage = sword_damage
  end
  def sword_hit
    @health = @health - sword_damage
  end
end

my_viking = Viking.new("Oleg", 10000, 90, 100, 40, 50, 30, 45, 65, 95)
puts my_viking.health
puts my_viking.name
my_viking.name = "Ilja"
puts my_viking.name
# binding.pry
