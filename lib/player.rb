require_relative('cat.rb')

class Player
    attr_accessor :name, :cat, :pawz
    
    def initialize(name)
        @name = name
        @cat = Cat.new("Kitty")
        @pawz = 400
    end

    def self.create
        player_array = []
        puts "create a player!\n"
        puts "would you like to create a new player? (y/n)"
        user_input = gets.chomp
        if user_input == 'y'
            puts "what would you like to name your player? "
            player_name = gets.chomp
            player = Player.new(player_name)
            player_array=[] << player
        elsif user_input == 'n'
        player_array
        end
    end

    def self.all
        players = []
        File.open('./saves/players', 'r') do |file|
          file.each do |line|
            name = line
            players << Player.new(name.chomp!)
          end
        end
        players
    end

    def self.find_by_email(name)
        players = []
        all.each do |user|
            if  name == user
                puts "Match! Found user by name.\n"
                puts "Query: #{name}. Player name"
                players << Player.new(user.name)
            else
                puts "No!"
            end
        end
        players
    end
end
