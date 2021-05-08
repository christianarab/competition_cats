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
            puts "create a player!\n"
            puts "would you like to create a new player? (y/n)"
            user_input = gets.chomp
            if user_input == 'y'
                break if user_input == 'n'
                puts "what would you like to name your player? "
                user_input = gets.chomp
                new_player = Player.new(user_input)
                puts "meow!! welcome #{new_player.name}"
                puts new_player.has_cat?
            else
            end
        when 'p'
            puts "play a game! meow, to be implimented"
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