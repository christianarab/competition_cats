require_relative('./tests/my_tests.rb')
require_relative('./lib/cat.rb')
require_relative('./lib/player.rb')
require_relative('./lib/game.rb')
require_relative('./lib/playfight.rb')
require_relative('./lib/againstmice.rb')
require_relative('./lib/competition.rb')
require_relative('./lib/menu.rb')

class App
    def self.run
        puts "Running Competition Cats!"
        while true do
            puts MENU
            user_input = gets.chomp

            case user_input
            when 'q'
                break
            when 'c'
                Cat.create_cat
            when '1'
                Againstmice.run
            when 'l'
                Player.load
                Player.list
            when 'n'
                Player.create
            when 'm'
            else
                puts "It broke! ouch"
            end
        end 
    end

end

App.run
    def self.run_tests
        puts "-------------Start of run_tests--------------"
        sparky = Cat.new("Sparky")
        puts "TEST 1: I expect Sparky to be initalized to have 100 energy points.\n"
        MyTest.expect_equal(sparky.energy, 100)
        puts "TEST 2: I expect Againstmice game to run and print result.\n"
        MyTest.expect_equal(Againstmice.run, Againstmice.results)
    end
end

App.run_tests
App.run

