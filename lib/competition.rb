require_relative ('cat.rb')
require_relative ('againstmice.rb')
# Welcome to competition cats, were our furry (sometimes not) friends compete with their nine lives!
# Competition is a series of games that create challenges for players' cats.
# The cat that wins the most rounds out of 3 wins the competition.
# To enter a competition, the player must use 1 player points. By winning a competition the player will earn a player point.
class Competition
  # Todo: revise paw fight
  def self.paw_fight(player_1, player_2)
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
  def self.count_mice(player_1)
    puts "Meow, find the number of mice in this room wins! There are up to 25 mice. You have 9 tries."
    mice = rand(25)

    counter = 9
    while counter > 0
    print "Type in your guess: "
    guess = gets.to_i
      if guess == mice
        puts "You found the mice!"
        "win"
      counter = 0
      elsif guess < mice
        puts "Your guess is smaller the mice"
        counter -= 1
      elsif guess > mice
        puts "Your guess is bigger the mice"
        counter -= 1
      else counter = 0
        puts "Ran out of tries"
        "lose"
      end
    end
  end
  ############################################
  ############## AGAINST MICE ################
  ############################################
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

  def self.against_mice_run(cat1, cat2)
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

  def self.against_mice_ui(player_1, player_2)
    puts "Paw fight!!!"
    player_1.tokens -= 1
    player_2.tokens -= 1
    if against_mice_run(player_1.cat, player_2.cat) == "player 1 win"
      player_2.losses += 1
      player_1.wins += 1
      player_1.tokens += 3
      player_1.pawz += 25
      puts "#{player_1.cat.name} total wins: #{player_1.wins}\n"
      puts "#{player_1.user.email} recieves 3 more tokens and 25 pawz. Tokens: #{player_1.tokens} Pawz: #{player_1.pawz}\n"
      Player.save(player_1)
    elsif 
      player_1.losses += 1
      player_2.wins += 1
      player_2.tokens += 3
      player_2.pawz += 25
      puts "#{player_2.cat.name} total wins: #{player_2.wins}\n"
      puts "#{player_2.user.email} recieves 3 more tokens and 25 pawz. Tokens: #{player_2.tokens} Pawz: #{player_1.pawz}\n"
      Player.save(player_1)
    end
  end

  ############################################
  ############################################

  # Todo: revise prize, and reward system
  def self.prize(player_1, player_2)
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

  def quiz(player)
    puts "Welcome to University of Cats CAT101 exam!"
    puts "Meow, here is 10 feline questions."
    puts "If you can get 7 out of 10, you pass"
    puts "meow you got this good luck!!"
  
    @score = 0
  
    q1 = ["Cats can sweat through their paws: true or false?\n\tA) true\t\tB) false", 'a',"The correct answer is a! Cats sweat out of paws"]
    q2 = ["What is a name of a group of cats?\n\tA) School B) Shoaling C) Clowder D) Walering", 'c', "The correct answer is clowder. Also, known as 'glaring'!"]
    q3 = ["Toxoplasmosis is a parasitic disease that is transmittable through feline sexual reproduction:\n\tt for True/f for False?", 't', "The correct answer is true!"]  
    q4 = ["Fill in the blank: Denmark, 1995 -- the ___ Cat was born. The cat has been extensively researched, yet with no solid conclusion for it's unique trait:\n\tA) screaming B) tallest C) oldest D) Green", 'd', "The correct answer is Green."]
    q5 = ["How many bones do cats have?\n\tA)300 B)230 C)145 D)206", 'b', "Cats have 230 bones, a whopping 24 more bones than humans!"]
    q6 = ["What is the name of a group of kittens?\n\tA) kindle B) krowder C) pawter D) Shoaling", 'a', "A group of kittens is called a “kindle."]
    q7 = ["Do indoor cats live longer than outdoor cats?\n\tt for True/f for False?", 't', "According to research indoor cats have a longer life span on average"]
    q8 = ["On average, how many whiskers does a cat have on ONE side of its face?\n\tA) 8 B) 9 C) 14 D)12", 'd',"There are roughly 24 whiskers, 12 on each side, on a cats face"]
    q9 = ["On average, how many kittens does a mother have in one litter?\n\tA)1-2 B)2-3 C)3-4 5)6", 'b', "A mother cat usually gives birth to 2-3 per litter, and can have approx. 2 litters per year!"]
    q10 = ["As the end of 2021, how old is the comic Garfield?\n\tA) 29 B) 35 C)43 D) 31", 'c', "Garfield launched on June 19, 1978 - making it 43 years old as of June!"]
  
    questions = [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10]
  
    for question in questions
      puts question[0]
      answer = gets.chomp.downcase
      puts question[2]
      if answer == question[1]
        puts "You are correct"
        @score += 1
      else
        puts "Better luck next time"
      end
    end
  
    if @score >= 7
      "win"
    else
      "lose"
    end
  end  

  def self.run(player_1, player_2)
    count_mice(player_1)
    count_mice(player_2)
    quiz(player_1)
    quiz(player_2)
  end
end
