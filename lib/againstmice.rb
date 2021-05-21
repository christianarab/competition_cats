require_relative ('cat')

# Againstmice is a mini game for two cats. 300 mice are spawned with different agility. It is your cats job to catch as many as they can.
# The cat that catches the most mice wins!
class Againstmice
  attr_accessor :tally, :cat1, :cat2, :mice

  def initialize(cat1, cat2)
    @cat1, @cat2 = cat1, cat2
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
    return @tally
  end

  # Display results
  def self.results
    puts cat_1_chance_to_win = compete(@cat1)
    puts cat_2_chance_to_win = compete(@cat2)

    if cat_1_chance_to_win > cat_2_chance_to_win
      puts "Cat 1 wins, Cat 2 looses"
    else
      puts "Cat 2 wins, Cat 1 looses"
    end
  end

  # Runs game
  def self.run
    puts "against mice!"
    puts "enter player one's cat name"
    cat_one = gets.chomp
    puts "enter player two's cat name"
    cat_two = gets.chomp
    against_mice = Againstmice.new(Cat.new(cat_one), Cat.new(cat_two))
    spawn
    compete
    results
  end
end