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
            when 'n'
                Player.create
            when 'c'
                Cat.create_cat
            when '1'
                Againstmice.run
            when 'l'
                Player.all
            when 'm'
            else
                puts "It broke! ouch"
            end
        end 
    end
end
Player.find_by_email("Christian")
App.run

# Load menu
    # Create players
        # 
    # Create cat
    # Select Games
        # Select your cat
            # TODO _______________
        # Play against computer
            # Against Mice game
            # TODO ________________
    # List players
        # Runs Player.all: reads player file, puts data
    # Quit program