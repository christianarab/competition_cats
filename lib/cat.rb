require_relative('player.rb')

# I hope you are a cat person... or atleast appeciate a cute one because this game is all about cats!
# Cats act as your companions in Competition Cats. Each cat uniquely have both strength and weaknesses.
# Each cat should have a name, size, confidence, agility, and strength. These traits effect gameplay.
# Cats are entered into competitions against mutliple human players and/or computer opponents.
# Results of competitions are reflected through wins, looses, ties, and competition wins
class Cat

  attr_accessor :wins, :losses, :energy, :name, :strength, :size, :agility, :confidence

  # Todo: clean up and finalize attributes of cat
  def initialize(name, size, energy, confidence, agility, strength)
    @name = name
    @size = ['small', 'medium', 'large'].sample
    @energy = 100
    @confidence = confidence
    @agility = agility
    @strength = strength
  end

  # Todo: revise save, creating association to player profile.
  def save
    File.open('././data/cats', 'a') do |file|
      file.write("#{@name}, #{@size}, #{energy}, #{confidence}, #{agility}, #{strength}\n")
    end
  end

  def self.load 
    cats = []
    File.open('././data/cats', 'r') do |file|
      file.each_line do |line|
        name, size, energy, confidence, agility, strength = line.split(", ")
        cats << Cat.new(name, size, energy, confidence, agility, strength.chomp)
      end
    end
    cats
  end

  # Agility determined by size of cat
  def agility
    base = 50
    case size
    when 'small'
      bonus = 25
    when 'medium'
      bonus = 10
    when 'large'
      bonus = 0
    end
    @agility = base + bonus
  end

  # Strength determined by size of cat
  def strength
    base = 50
    case size
    when 'large'
      bonus = 25
    when 'medium'
      bonus = 10
    when 'small'
      bonus = 0
    end
    @strength = base + bonus
  end

  # Confidence
  def confidence
    # scale from 1 to 100
    base = 50
    current_confidence = base
    if current_confidence > 100
      return 100
    elsif
      current_confidence < 1
      return 1
    else
      current_confidence
    end        
  end

  def to_s
    "name: #{@name}, size: #{@size}, energy: #{@energy}, agility: #{@agility}, strength: #{@strength}, confidence: #{@confidence}"
  end
end
