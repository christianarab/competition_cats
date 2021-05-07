require_relative('./tests/my_tests.rb')
require_relative('./lib/cat.rb')
require_relative('./lib/player.rb')
require_relative('./lib/game.rb')
require_relative('./lib/playfight.rb')

class Competition
    attr_accessor :player_1, :player_2

    def initialize(player_1, player_2)
        @player_1 = player_1
        @player_2 = player_2
    end
end

class Againstmice
    attr_accessor :tally, :cat1, :cat2
    
    def initialize(cat1, cat2)
        @cat1, @cat2 = cat1, cat2
        @tally = 0
    end
    
    def spawn
        mice = []
        count = 100
        while count > 0 do
            agility = rand(1..100)
            if agility < 100 && agility > 85
                mice << 3
            elsif agility < 85 && agility > 60
                mice << 2
            else
                mice << 1
            end
            mice
            count -= 1
        end
        mice
    end
    
    def comp(*tally)
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
    
    def results
        puts cat_1_chance_to_win = comp(@cat1)
        puts cat_2_chance_to_win = comp(@cat2)
        
        if cat_1_chance_to_win > cat_2_chance_to_win
            puts "Cat 1 wins, Cat 2 looses"
        else
            puts "Cat 2 wins, Cat 1 looses"
        end
    end
end

def test_player_setup
    # Profile setup: two players - one with cat, one without
    puts "======TEST PLAYER SETUP======"
    player_profile_1 = Player.new("Christian", "meow master")
    player_profile_2 = Player.new("Lee")
    puts "EXPECTED TO PASS: "
    MyTest.expect_equal(player_profile_1.has_cat?, "Player has selected cat")
    puts "EXPECTED TO FAIL: "
    MyTest.expect_equal(player_profile_2.has_cat?, "Player has selected cat")
end



def test_competition
    # Starts new game (Competition) with player 1, player 2, arg. to denote game type
    puts "======TEST COMPETITION======"
    player_profile_1 = Player.new("Christian", "meow master")
    player_profile_2 = Player.new("Lee", "Lee's cat")
    game_instance = Game.new(player_profile_1, player_profile_2, "competition")
    puts "Is ln. 212 game_instance running an instance of Competition?"
    puts game_instance.game.instance_of?(Competition)
end


def test_playfight
    # Starts new game (Playfight) with player 1, player 2, arg. to denote game type
    puts "======TEST PLAYFIGHT======"
    player_profile_1 = Player.new("Christian", "meow master")
    player_profile_2 = Player.new("Lee", "Lee's cat")
    game_instance2 = Game.new(player_profile_1, player_profile_2, "Playfight")
    puts "Should print out result of Playfight."
    puts game_instance2.game.compete
end

def test_class_competition
    puts "=====TESTING COMPETITION CLASS========"
    cat1 = Cat.new("Meowmaster")
    cat2 = Cat.new("Catnip_lover")

    new_competition = Competition.new(Player.new("christian", "Meowmaster"), Player.new("someone", "Catnip_lover"))

    puts "Tests Competition Player #1's Cat's name: \n"
    puts "EXPECTED TO PASS:\n"
    MyTest.expect_equal(new_competition.player_1.cat.name, cat1.name)
    puts "EXPECTED TO FAIL:\n"
    MyTest.expect_equal(new_competition.player_1.cat.name, cat2.name)
end

def run
  test_player_setup
  test_playfight
  test_competition
  test_class_competition
end

run