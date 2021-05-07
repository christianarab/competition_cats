class Againstmice
    attr_accessor :tally, :cat1, :cat2
    
    def initialize(cat1, cat2)
        @cat1, @cat2 = cat1, cat2
        @tally = 0
    end
    
    def spawn
        mice = []
        count = 100
        while count > 0 do
            agility = rand(1..100)
            if agility < 100 && agility > 85
                mice << 3
            elsif agility < 85 && agility > 60
                mice << 2
            else
                mice << 1
            end
            mice
            count -= 1
        end
        mice
    end
    
    def comp(*tally)
        @tally = 0
        mice1 = spawn
        mice2 = spawn
        mice1.zip(mice2).map do |x, y|
            if x > y    
                puts "Cat caught mouse!" 
                @tally += 1
            else
                puts "Mouse ran away!"
            end
        end
        @tally
    end
    
    def results
        puts cat_1_chance_to_win = comp(@cat1)
        puts cat_2_chance_to_win = comp(@cat2)
        
        if cat_1_chance_to_win > cat_2_chance_to_win
            puts "Cat 1 wins, Cat 2 looses"
        else
            puts "Cat 2 wins, Cat 1 looses"
        end
    end
end