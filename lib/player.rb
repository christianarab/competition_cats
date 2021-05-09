require_relative('cat.rb')

class Player
    attr_accessor :name, :cat
    def initialize(name)
        @name = name
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

    def self.add_cat
        puts "would you like to add a cat to your profile? meow!"
        #  list cats
        # select cat
    end

    def self.list
        loaded_players = self.load
        puts "These are the current players:"
        loaded_players.each_with_index do |player, index|
            puts "\t#{index+1}) #{player.name}"
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
