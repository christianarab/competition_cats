require_relative('cat.rb')

class Player
    attr_accessor :name, :cats

    def initialize(name)
        @name = name
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
