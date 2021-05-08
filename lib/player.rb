require_relative ('cat.rb')

class Player
    attr_accessor :name, :cat

    def initialize(name, cat=nil)
        @name = name
        @cat = cat==nil ? nil : Cat.new(cat)
    end

    def has_cat?
        user_input = nil
        if @cat == nil
            puts "Player has no cat. Please name your cat:"
            user_input == gets.chomp
            @cat = Cat.new(user_input)
            puts "meow meow... meow meow MEOWWWWW"
            puts "meow welcome to the human world #{@cat.name}"
        else
            return "Player has selected cat"
        end
    end

    def self.player_cat
        puts cat.to_s
    end
end
