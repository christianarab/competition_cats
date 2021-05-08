require_relative('cat.rb')

class Player
    attr_accessor :name, :cat

    def initialize(name)
        @name = name
        @cats = []
    end

    def self.save(cat)
        File.open('./saves/cat', 'a') do |file|
            file.write("#{cat}\n")
        end
    end

    def self.cats(to_add)
        @cats = [] << to_add
    end

    def self.create
        puts "create a player!\n"
        puts "would you like to create a new player? (y/n)"
        user_input = gets.chomp
        if user_input == 'y'
            puts "what would you like to name your player? "
            user_input = gets.chomp
            player = Player.new(user_input)
            @players=[] << player
        elsif user_input == 'n'
        end
    end
end
