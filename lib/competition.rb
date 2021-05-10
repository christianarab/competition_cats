require_relative('cat.rb')

class Competition
    attr_accessor :player_1, :player_2, :cat

    def initialize(player_1, player_2)
        @player_1, @player_2 = player_1, player_2
        @p1_wins = 0
        @p2_wins = 0
    end

    def self.generate_move(cat)
        modifier = [1, 250, 500, 750, 1000].sample
        points = ((cat.strength * cat.confidence) + (modifier * 3))
        points.to_i
    end 

    def self.arm_fight(cat1, cat2)
        p1_wins = 0
        p2_wins = 0
        player_1_move = self.generate_move(cat1)
        player_2_move = self.generate_move(cat2)
        puts player_1_move
        puts player_2_move
        puts "meow paw fight!!!"
        if player_1_move.to_i > player_2_move.to_i
            # @player_1.wins += 1
            # @player_1.strength + 50
            # @player_2.losses += 1            
            puts "#{cat1.name} wins!"
            cat1.wins += 69
            # return p1_wins += 1
        elsif player_2_move.to_i < player_1_move.to_i
            # @player_2.wins += 1
            # @player_2.strength + 50
            # @player_1.losses += 1
            puts "#{cat2.name} wins!"
            cat1.wins += 69
            # return p2_wins += 1
        else
            puts "Wow it's broken!"
        end
    end

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

    def self.run(cat1, cat2)
        arm_fight(cat1, cat2)
        count_mice(cat1, cat2)
        prize(cat1, cat2)
    end

end