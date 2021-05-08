require_relative ('cat.rb')

class Player
    attr_accessor :name, :cat

    def initialize(name)
        @name = name
        @cat = ''
        @cats = []
    end

    def has_cat?
        user_input = ''
        if @cat == ''
            puts "Player has no cat. Please name your cat:"
            user_input = gets.chomp
            new_cat = Cat.new(user_input)
            puts "meow meow... meow meow MEOWWWWW"
            puts "meow welcome to the human world #{new_cat.name}"
            @cats << new_cat
        else
            return "Player has selected cat"
        end
    end

    def self.player_cat
        puts cat.to_s
    end
end
