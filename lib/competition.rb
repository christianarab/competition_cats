require_relative ('cat.rb')
# Welcome to competition cats, were our furry (sometimes not) friends compete with their nine lives!
# Competition is a series of games that create challenges for players' cats.
# The cat that wins the most rounds out of 3 wins the competition.
# To enter a competition, the player must use 1 player points. By winning a competition the player will earn a player point.
class Competition
  attr_accessor :player, :computer
  @@computer = Cat.new("Computer", 'medium', 100, 50, 50, 50)

  # Todo: revise
  def initialize
    @p1_wins = 0
    @p2_wins = 0
  end

  # Todo: revise paw fight
  def self.paw_fight(cat)
    puts "This is a paw fight. Strongest paw grip wins!"
    puts "meow paw fight!!!"
    if cat.strength > @@computer.strength     
      puts "#{cat.name} wins!"
      return 'win'
    elsif cat.strength < @@computer.strength    
      puts "#{cat.name} wins!"
      return 'lose'
    else
      puts "#{cat.name} & #{@@computer.name}: It's a tie!"
    end
  end

  # Count mice is a game where players, have to guess the number of mice in the room.
  def self.count_mice(cat1, cat2)
    puts "Meow, first one to find the number of mice in this room wins!"
    mice = rand(25)

    counter = 10
    while counter > 0
    print "Type in your guess: "
    guess = gets.to_i
      if guess == mice
        puts "You found the mice!"
      counter = 0
      elsif guess < mice
        puts "Your guess is smaller the mice"
      elsif guess > mice
        puts "Your guess is bigger the mice"
      elsif counter = 0
        puts "Ran out of tries"
        puts "Next players turn!"
      end
      counter -= 1
    end
  end

  # Todo: revise prize, and reward system
  def self.prize(cat1, cat2)
    if cat1.wins > cat2.wins
      puts "Congrats player one, you win the competition!"
      cat1.competition_wins += 1
    elsif cat2.wins > cat1.wins
      puts ""
      cat2.competition_wins += 1
    else 
      puts "It's a tie"
    end
  end
end
