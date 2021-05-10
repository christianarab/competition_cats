require_relative('./tests/my_tests.rb')
require_relative('./lib/cat.rb')
require_relative('./lib/player.rb')
require_relative('./lib/playfight.rb')
require_relative('./lib/againstmice.rb')
require_relative('./lib/competition.rb')


def run_tests
    christian = Cat.new("christian")
    computer = Cat.new("computer")
    Competition.arm_fight(christian, computer)

    puts "-------------Start of run_tests--------------"
    sparky = Cat.new("Sparky")
    puts "TEST 1: Expect Sparky to be initalized to have 100 energy points.\n"
    MyTest.expect_equal(sparky.energy, 100)
    puts "TEST 2: Expect Againstmice game to run and return results.\n"
    MyTest.expect_equal(Againstmice.run, Againstmice.results)
    puts "TEST 3: Expect code to initalize players from file.\n"
    puts "\t#{Player.all}"
    puts "TEST 4: Expect that cat wins equal 69."
    MyTest.expect_equal(christian.wins || computer.wins, 69)
    puts "Cat Christian #{christian.wins} wins"
    puts "Cat Computer #{computer.wins} wins"
end

run_tests


# def test_player_setup
#     # Profile setup: two players - one with cat, one without
#     puts "======TEST PLAYER SETUP======"
#     player_profile_1 = Player.new("Christian", "meow master")
#     player_profile_2 = Player.new("Lee")
#     puts "EXPECTED TO PASS: "
#     MyTest.expect_equal(player_profile_1.has_cat?, "Player has selected cat")
#     puts "EXPECTED TO FAIL: "
#     MyTest.expect_equal(player_profile_2.has_cat?, "Player has selected cat")
# end

# def test_competition
#     # Starts new game (Competition) with player 1, player 2, arg. to denote game type
#     puts "======TEST COMPETITION======"
#     player_profile_1 = Player.new("Christian", "meow master")
#     player_profile_2 = Player.new("Lee", "Lee's cat")
#     game_instance = Game.new(player_profile_1, player_profile_2, "competition")
#     puts "Is ln. 212 game_instance running an instance of Competition?"
#     puts game_instance.game.instance_of?(Competition)
# end

# def test_playfight
#     # Starts new game (Playfight) with player 1, player 2, arg. to denote game type
#     puts "======TEST PLAYFIGHT======"
#     player_profile_1 = Player.new("Christian", "meow master")
#     player_profile_2 = Player.new("Lee", "Lee's cat")
#     game_instance2 = Game.new(player_profile_1, player_profile_2, "Playfight")
#     puts "Should print out result of Playfight."
#     puts game_instance2.game.compete
# end

# def test_class_competition
#     puts "=====TESTING COMPETITION CLASS========"
#     cat1 = Cat.new("Meowmaster")
#     cat2 = Cat.new("Catnip_lover")

#     new_competition = Competition.new(Player.new("christian", "Meowmaster"), Player.new("someone", "Catnip_lover"))

#     puts "Tests Competition Player #1's Cat's name: \n"
#     puts "EXPECTED TO PASS:\n"
#     MyTest.expect_equal(new_competition.player_1.cat.name, cat1.name)
#     puts "EXPECTED TO FAIL:\n"
#     MyTest.expect_equal(new_competition.player_1.cat.name, cat2.name)
# end

# def run
#     test_player_setup
#     test_playfight
#     test_competition
#     test_class_competition
# end