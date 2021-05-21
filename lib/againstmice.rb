require_relative ('cat')

# Againstmice is a mini game for two cats. 300 mice are spawned with different agility. It is your cats job to catch as many as they can.
# The cat that catches the most mice wins!
class Againstmice
  attr_accessor :tally, :mice, :computer

  def initialize(player)
    @player = player
    @tally = 0
  end

  # The mice spawn with agility traits determined by a random algorithm. 
  def self.spawn
    @mice = []
    count = 100
    while count > 0 do
      agility = rand(1..100)
      if agility < 100 && agility > 85
        @mice << 3
      elsif agility < 85 && agility > 60
        @mice << 2
      else
        @mice << 1
      end
      @mice
      count -= 1
    end
    @mice
  end

  # Compete is used for each cat
  def self.compete(*tally)
    @tally = 0
    mice1 = spawn
    mice2 = spawn
    mice1.zip(mice2).map do |x, y|
      if x > y
        puts "Cat caught mouse!"
        @tally += 1
      else
        puts "Mouse ran away!"
      end
    end
    @tally
  end

  # Display results
  def self.results(cat)
    cat_1_chance_to_win = compete(cat)
    cat_2_chance_to_win = compete(@computer)

    if cat_1_chance_to_win > cat_2_chance_to_win
      puts "#{cat.name} wins, Computer looses!"
      "win"
    else
      puts "#{cat.name} looses!"
      "lose"
    end
  end

  # Runs game
  def self.run(cat)
    spawn
    compete
    results(cat)
  end
end