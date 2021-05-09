require_relative('againstmice.rb')
require_relative('playfight.rb')

class Game
    attr_accessor :player_1, :player_2
    
    def initialize(player_1, player_2)
        @player_1 = player_1
        @player_2 = player_2
    end

    # def game_playfight
    #     Playfight.run
    # end

    # def game_mice
    #     Againstmice.run
    # end

end
