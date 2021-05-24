require_relative ('cat.rb')
# Welcome to competition cats, were our furry (sometimes not) friends compete with their nine lives!
# Competition is a series of games that create challenges for players' cats.
# To enter a competition, the player must use 3 tokens. By winning a competition the player will earn double the tokens.
class Competition

  ############################################
  ##############   PAW FIGHT   ############### 
  ############################################

  def self.paw_fight_run(player_1, player_2)
    puts "This is a paw fight. Strongest paw grip wins!"
    puts "meow paw fight!!! please check out our sponsor... "
    puts "...try the new beyondmice burger from pawzmart〔◉⊥◉〕it's great!!".colorize(:red)
    cat_1_mod = (player_1.cat.strength * player_1.cat.confidence / 2) 
    player_1.cat.strength += cat_1_mod * rand(0..3)
    cat_2_mod = (player_2.cat.strength * player_2.cat.confidence / 2) 
    player_2.cat.strength += cat_2_mod * rand(0..3)
    if player_1.cat.strength > player_2.cat.strength     
      puts "Wow that was close!! #{player_1.cat.name} the catwins!"
      'player 1 win'
    elsif player_2.cat.strength < player_1.cat.strength    
      puts "#{player_2.cat.name} wins!"
      'player 2 win'
    else
      puts "It's a tie!"
    end
  end

  def self.paw_fight_run(player_1, player_2)
    puts "Paw fight!!!"
    puts "Earn free tokens and pawz by playing this game and watching our advertisement!"
    if paw_fight_run(player_1, player_2) == "player 1 win"
      winner_is?(p1=true, p2=false, player_1, player_2)
    else 
      winner_is?(p1=false, p2=true, player_1, player_2) 
    end
  end

  ############################################
  ##############   COUNT MICE   ##############
  ############################################

  # Count mice is a game where players, have to guess the number of mice in the room.

  def self.count_mice_run(player_1, player_2)
    if player_1.tokens < 1 
      puts "#{player_1.user.email}: You need to earn more tokens!".colorize(:red)
    else
      player_1.tokens -= 1
      player_2.tokens -= 1
      @p1_score = 0
      @p2_score = 0
      @counter = 0

      while @counter < 3
        count_mice(player_1) == 'win' ? @p1_score +=1 : @p1_score 
        count_mice(player_2) == 'win' ? @p2_score +=1 : @p2_score
        @counter += 1
      end

      if @p1_score > @p2_score
        puts "#{player_1.user.email} has won!"
        self.winner_is?(p1=true, p2=false, player_1, player_2)
      else
        puts "#{player_2.user.email} has won!"
        self.winner_is?(p1=false, p2=true, player_1, player_2)
      end
    end
  end

  def self.count_mice(player)
    puts "Meow, it is #{player.user.email} turn!!! \nFind the number of mice in this room wins! There are up to 25 mice. You have 9 tries."
    mice = rand(25)
    
    counter = 9
    while counter > 0
    print "Type in your guess: "
    guess = gets.to_i
      if guess == mice
        puts "You found the mice!"
        return 'win'
      counter = 0
      elsif guess < mice
        puts "Your guess is smaller the mice"
        counter -= 1
      elsif guess > mice
        puts "Your guess is bigger the mice"
        counter -= 1
      else counter = 0
        puts "Ran out of tries"
        return 'lose'
      end
    end
  end

  ############################################
  ############## AGAINST MICE ################
  ############################################

  # 100 mice are put in an array, with their own agility points
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

  def self.against_mice(cat1, cat2)
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

  def self.against_mice_run(player_1, player_2)
    puts "Paw fight!!!"
    if player_1.tokens < 1 
      puts "#{player_1.user.email}: You need to earn more tokens!".colorize(:red)
    else
      player_1.tokens -= 1
      player_2.tokens -= 1
      if against_mice(player_1.cat, player_2.cat) == "player 1 win"
        winner_is?(p1=true, p2=false, player_1, player_2)
      else 
        winner_is?(p1=false, p2=true, player_1, player_2)
      end
    end
  end

  ############################################
  ############## CATS101 EXAM ################
  ############################################

  def self.quiz_run(player_1, player_2)
    if player_1.tokens < 1 
      puts "#{player_1.user.email}: You need to earn more tokens!".colorize(:red)
    else
      player_1.tokens -= 1
      player_2.tokens -= 1
      puts "Welcome to University of Cats CAT101 exam!".colorize(:red)
      puts "Meow, here is 10 feline questions."
      puts "The cat to get the most points wins!"

      puts "Player 1 up first! (psssss player 2 don't look please!)".colorize(:green)
      p1_score = quiz(player_1)
      puts "#{player_1.user.email} scored #{p1_score} out of 10"
      puts "Next up, Player 2!!!".colorize(:green)
      if player_2.user.email == "Computer"
        puts "You are playing against a computer."
        p2_score = rand(0..8)
        puts "The computer scored #{p2_score} out of 10!"
      else
        p2_score = quiz(player_2)
        puts "#{player_2.user.email} scored #{p2_score}"
      end
      if p1_score > p2_score
        winner_is?(p1=true, p2=false, player_1, player_2)
      elsif p2_score > p1_score
        winner_is?(p1=false, p2=true, player_1, player_2)
      else
        winner_is?(p1=true, p2=true, player_1, player_2)
      end
    end
  end

  def self.quiz(player)
    @score = 0
  
    # The questions
    q1 = ["Cats can sweat through their paws: true or false?\n\tA) true\t\tB) false", 'a',"The correct answer is a! Cats sweat out of paws"]
    q2 = ["What is a name of a group of cats?\n\tA) School B) Shoaling C) Clowder D) Walering", 'c', "The correct answer is clowder. Also, known as 'glaring'!"]
    q3 = ["Toxoplasmosis is a parasitic disease that is transmittable through feline sexual reproduction:\n\tt for True/f for False?", 't', "The correct answer is true!"]  
    q4 = ["Fill in the blank: Denmark, 1995 -- the ___ Cat was born. The cat has been extensively researched, yet with no solid conclusion for it's unique trait:\n\tA) screaming B) tallest C) oldest D) Green", 'd', "The correct answer is Green."]
    q5 = ["How many bones do cats have?\n\tA)300 B)230 C)145 D)206", 'b', "Cats have 230 bones, a whopping 24 more bones than humans!"]
    q6 = ["What is the name of a group of kittens?\n\tA) kindle B) krowder C) pawter D) Shoaling", 'a', "A group of kittens is called a 'kindle'."]
    q7 = ["Do indoor cats live longer than outdoor cats?\n\tt for True/f for False?", 't', "According to research indoor cats have a longer life span on average"]
    q8 = ["On average, how many whiskers does a cat have on ONE side of its face?\n\tA) 8 B) 9 C) 14 D)12", 'd',"There are roughly 24 whiskers, 12 on each side, on a cats face"]
    q9 = ["On average, how many kittens does a mother have in one litter?\n\tA)1-2 B)2-3 C)3-4 D)6", 'b', "A mother cat usually gives birth to 2-3 per litter, and can have approx. 2 litters per year!"]
    q10 = ["As the end of 2021, how old is the comic Garfield?\n\tA) 29 B) 35 C)43 D) 31", 'c', "Garfield launched on June 19, 1978 - making it 43 years old as of June!"]
  
    # Questions in array
    questions = [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10]
  
    # Iterate over questions in array: For each, print 0th element, ask and compare input to 1st element. If correct add 1 to score.
    for question in questions
      puts question[0].colorize(:red)
      answer = gets.chomp.downcase
      puts question[2].colorize(:light_green)
      if answer == question[1]
        puts "You are correct!"
        @score += 1
      else
        puts "Better luck next time."
      end
    end
    @score
  end 

  ############################################
  ########### COMPETITION BATTLE #############
  ############################################
  
  def self.turn(player)
    puts "(a)ttack, (d)efend with paws, or (r)etreat"
    user_input = gets.chomp
    case user_input
    when 'a'
      'attack'
    when 'd'
      'defence'
    when 'r'
      'forfeit'
    end
  end

  def self.comp_run(player_1, player_2)
    puts "player 1 turn choice: "
    p1_move = turn(player_1)
    # Computer or human turn
    if player_2.user.email == 'Computer'
      p2_move = ['attack', 'defence'].sample
    else
      puts "player 2 turn choice: "
      p2_move = turn(player_2)
    end
    if p1_move && p2_move == 'attack'
      puts "#{player_1.cat.name} and #{player_2.cat.name} both attacked!"
      if player_1.cat.strength > player_2.cat.strength
        puts "Attack successful! #{player_2.cat.name} is down! "
        player_2.cat.energy -= 25
      else player_1.cat.strength < player_2.cat.strength
        puts "#{player_1.cat.name} took the damage! "
        player_1.cat.energy -= 25
      end
    elsif p1_move == 'attack' && p2_move == 'defence'
      puts "#{player_1.cat.name} attacked and #{player_2.cat.name} defended!"
      if player_1.cat.strength > player_2.cat.agility
        puts "Attack successful! #{player_2.cat.name} is down! "
        player_2.cat.energy -= 25
      else
        puts "#{player_2.cat.name} over took the attack! "
        player_1.cat.energy -= 25
      end
    elsif p2_move == 'attack' && p1_move == 'defence'
      puts "#{player_2.cat.name} attacked and #{player_2.cat.name} defended!"
      if player_2.cat.strength > player_1.cat.agility
        puts "Attack successful! #{player_1.cat.name} is down! "
        player_1.cat.energy -= 25
      else
        puts "#{player_1.cat.name} defended well! "
        player_2.cat.energy -= 25
      end
    elsif p2_move == 'defence' && p1_move == 'defence' 
      puts "You both defended! You are both scaredy cats!"
    elsif p1_move == 'forfeit'
      puts "#{player_1.cat.name} gives up!"
      puts player_1.cat.energy -= 100
    elsif p2_move == 'forfeit'
      puts "#{player_2.cat.name} gives up!"
      puts player_2.cat.energy -= 100
    else
      puts "Something went wrong!"
    end
  end

  def self.competition_mode(player_1, player_2)
    if player_1.tokens < 3 
      puts "#{player_1.user.email}: You need to earn more tokens!".colorize(:red)
    else
      player_1.tokens -= 3
      player_2.tokens -= 3
      @p1_score = 0
      @p2_score = 0
      counter = 0
      p1_start_strength = player_1.cat.strength 
      p2_start_strength = player_2.cat.strength
      player_1.cat.strength = player_1.cat.strength * player_1.cat.move_luck 
      player_2.cat.strength = player_2.cat.strength * player_2.cat.move_luck
      puts "The best out of 6 rounds wins the competition!"
      while counter < 6 do
          comp_run(player_1, player_2)
          puts "#{player_1.cat.name}'s energy is at #{player_1.cat.energy}"
          puts "#{player_2.cat.name}'s energy is at #{player_2.cat.energy}"
          if player_1.cat.energy < player_2.cat.energy
            @p2_score += 1
          else player_2.cat.energy < player_1.cat.energy
            @p1_score += 1
          end
        counter += 1
      end
      if @p1_score > @p2_score
        puts "#{player_1.cat.name} wins the competition!"
        puts "You earn 1 competition win, 3 tokens & 500 pawz!"
        player_1.competition_wins += 1
        player_2.losses += 1
        player_1.tokens += 3
        player_1.pawz += 500
        player_1.cat.energy = 100 # resets energy and strength
        player_2.cat.energy = 100
        player_1.cat.strength = p1_start_strength
        player_2.cat.strength = p1_start_strength
      elsif @p2_score > @p1_score
        puts "#{player_2.cat.name} wins the competition!"
        puts "You earn 1 competition win, 3 tokens & 500 pawz!"
        player_2.competition_wins += 1
        player_1.losses += 1
        player_1.tokens += 3
        player_2.pawz += 500
        player_1.cat.energy = 100
        player_2.cat.energy = 100
        player_1.cat.strength = p1_start_strength
        player_2.cat.strength = p1_start_strength
      else
        puts "#{player_1.cat.name} and #{player_2.cat.name} have both tied!"
        puts "Both earn 1 competition win, 3 tokens & 500 pawz!"
        player_1.competition_wins += 1
        player_2.competition_wins += 1
        player_1.pawz += 500
        player_2.pawz += 500
        player_1.tokens += 3
        player_2.tokens += 3
        player_1.cat.energy = 100
        player_2.cat.energy = 100
        player_1.cat.strength = p1_start_strength
        player_2.cat.strength = p1_start_strength
      end
    end
  end

  # The winner of 3 battles will be deemed the winner 

  ############################################
  ############## SCORE SYSTEM ################
  ############################################
  
  def self.winner_is?(p1=false, p2=false, player_1, player_2)
    if p1 == true
      player_2.losses += 1
      player_1.wins += 1
      player_1.tokens += 3
      player_1.pawz += 25
      puts "#{player_1.cat.name} total wins: #{player_1.wins}\n"
      puts "#{player_1.user.email} recieves 3 more tokens and 25 pawz. Tokens: #{player_1.tokens} Pawz: #{player_1.pawz}\n"
      Player.save(player_1)
      Player.save(player_2)
    elsif p2 == true
      player_1.losses += 1
      player_2.wins += 1
      player_2.tokens += 3
      player_2.pawz += 25
      puts "#{player_2.cat.name} total wins: #{player_2.wins}\n"
      puts "#{player_2.user.email} recieves 3 more tokens and 25 pawz. Tokens: #{player_2.tokens} Pawz: #{player_1.pawz}\n"
      Player.save(player_1)
      Player.save(player_2)
    else
      puts "It's a tie game!"
      player_1.wins += 1
      player_2.wins += 1
      player_1.tokens += 3
      player_2.tokens += 3
      Player.save(player_1)
      Player.save(player_2)
    end
  end
end
