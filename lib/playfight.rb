class Playfight
    attr_accessor :player_1, :player_2
    def initialize(player_1, player_2)
        @cat1, @cat2 = player_1, player_2
        puts @cat1.inspect
        puts @cat2.inspect
    end

    def chance_to_win(cat)
        luck = [1, 250, 500, 750, 1000].sample
        points = ((cat.strength + cat.agility) * cat.confidence) + (luck * 10)
    end

    def run
        cat_1_chance_to_win = chance_to_win(@cat1)
        cat_2_chance_to_win = chance_to_win(@cat2)

        if cat_1_chance_to_win > cat_2_chance_to_win
            @cat1.wins += 1
            @cat2.losses += 1
            return "#{@cat1.cat.name} wins!"
        elsif cat_1_chance_to_win < cat_2_chance_to_win
            @cat2.wins += 1
            @cat1.losses += 1
            return "#{@cat2.cat.name} wins!"
        else
            return "it's a tie!!!"
        end
    end
end
