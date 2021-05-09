require_relative('./tests/my_tests.rb')
require_relative('./lib/cat.rb')
require_relative('./lib/player.rb')
require_relative('./lib/game.rb')
require_relative('./lib/playfight.rb')
require_relative('./lib/againstmice.rb')
require_relative('./lib/competition.rb')
require_relative('./lib/menu.rb')

def run
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

run

