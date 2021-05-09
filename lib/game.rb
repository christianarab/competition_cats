require_relative('player.rb')
require_relative('againstmice.rb')
require_relative('playfight.rb')

class Game
    attr_accessor :player_1, :player_2
    
    def self.game_playfight(player_1, player_2)
        Playfight.run(player_1, player_2)
    end

    def game_mice
        Againstmice.run
    end

end
