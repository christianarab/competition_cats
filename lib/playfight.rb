class Playfight
    attr_accessor :player_1, :player_2
    def initialize(player_1, cat2)
        @cat1, @cat2 = cat1, cat2
    end

    def chance_to_win(cat)
        luck = [1, 250, 500, 750, 1000].sample
        points = ((cat.strength + cat.agility) * cat.confidence) + (luck * 10)
    end

    def self.run(player_1, player_2)
        cat_1_chance_to_win = chance_to_win(@player_1.cat)
        cat_2_chance_to_win = chance_to_win(@player_2.cat)

        if cat_1_chance_to_win > cat_2_chance_to_win
            @player_1.cat.wins += 1
            @player_2.losses += 1
            return "#{@player_1.cat.name} wins!"
        elsif cat_1_chance_to_win < cat_2_chance_to_win
            @player_2.wins += 1
            @player_1.losses += 1
            return "#{@player_2.cat.name} wins!"
        else
            return "it's a tie!!!"
        end
    end
end
