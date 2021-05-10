class Competition
    attr_accessor :player_1, :player_2

    def initialize(player_1, player_2)
        @player_1, @player_2 = player_1, player_2
        @p1_wins = 0
        @p2_wins = 0
    end

    def self.generate_move(cat)
        modifier = [1, 250, 500, 750, 1000].sample
        points = ((cat.strength * cat.confidence) + (modifier * 3))
    end 

    def self.arm_fight(player_1, player_2)
        player_1_move = self.generate_move(player_1.cat)
        player_2_move = self.generate_move(player_2.cat)
        puts "meow paw fight!!!"
        if player_1_move > player_2_move
            @p1_wins += 01
            @player_1.cat.wins += 1
            @player_1.cat.strength + 50
            @player_2.cat.losses += 1            
            puts "#{@player_1.cat.name} wins!"
        elsif player_2_move < player_1_move
            @p1_wins += 02
            @player_2.cat.wins += 1
            @player_2.cat.strength + 50
            @player_1.cat.losses += 1
            puts "#{@player_2.cat.name} wins!"
        end
    end

    def self.count_mice
        puts "Meow, first one to find the number of mice in this room wins!"
        mice = rand(25)

        counter = 10
        while counter > 0
        print "Type in your guess: "
        guess = gets.to_i
            if guess == mice
            puts "You found the mice!"
            @p1_wins += 1
            counter = 0
            elsif guess < mice
            puts "Your guess is smaller the mice"
            else
            puts "Your guess is bigger the mice"
            end
            counter -= 1
        end
        puts "Ran out of tries"
    end

    def self.prize
        if p1_wins > p2_wins
            puts "Congrats player one, you win the competition!"
            @player_1.cat.competition_wins += 1
        elsif p2_wins < p1_wins
            puts ""
            @player_2.cat.competition_wins += 1
        else p1_wins == p2_wins
            puts "It's a time"
    end
end