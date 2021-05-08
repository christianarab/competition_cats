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
            Player.create_user
        when 'p'
            against_mice_menu
        when 'l'
            puts "list players! meow, to be implimented"
        when 'm'
            puts MENU
        else
            puts "It broke! ouch"
        end
    end 
end

run