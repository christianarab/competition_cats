require_relative('cat.rb')

class Player
    attr_accessor :name, :cat

    def initialize(name, cat=nil)
        @name = name
        @cat = cat = nil ? nil : Cat.new(cat)
    end

    def self.create
        player_array = []
        puts "create a player!\n"
        puts "would you like to create a new player? (y/n)"
        user_input = gets.chomp
        if user_input == 'y'
            puts "what would you like to name your player? "
            player_name = gets.chomp
            puts "what would you like to name your cat? "
            cat_name = gets.chomp
            player = Player.new(player_name, cat_name)
            player_array=[] << player
        elsif user_input == 'n'
        end
        puts player_array.inspect
        player_array
    end

    def self.list
        loaded_players = self.load
        puts "These are the current players:"
        loaded_players.each_with_index do |player, index|
            puts "\t#{index+1}) #{player.name} #{player.cat.name}"
        end
    end

    def self.load
        players = []
        File.open('./saves/players', 'r') do |file|
          file.each do |line|
            name = line
            players << Player.new(name)
          end
        end
        players
    end
end
