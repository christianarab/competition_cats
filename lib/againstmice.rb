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
  def self.compete(cat)
    @tally = 0
    mice1 = spawn
    mice2 = spawn
    mice1.zip(mice2).map do |x, y|
      if x > y
        puts "#{cat.name} the cat caught mouse!"
        @tally += 1
      else
        puts "Mouse ran away! ~~(__^·>"
      end
    end
    @tally
  end

  # Runs game
  def self.run_againstmice(cat1, cat2)
    cat_1_chance_to_win = compete(cat1)
    cat_2_chance_to_win = compete(cat2)

    if cat_1_chance_to_win > cat_2_chance_to_win
      puts "#{cat1.name} wins!"
      "player 1 win"
    else
      puts "#{cat2.name} wins!"
      "player 2 win"
    end
  end
end