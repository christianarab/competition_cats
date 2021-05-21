require_relative ('cat.rb')

# Player belongs to user. Each player will have the feature to have, pick, and select cats for competition.
# Players will have currency (pawz) to purchase upgrades for their cats to be used in games. They will start with 400pawz.
# Players play points will determine how many games the User can enter. By default, players start with 5 - equal to 5 games.
# Players will automatically save and load according to their game outcomes, point usage, etc.
# Todo: add cat selection flow, ability to view cats at hand
class Player
  attr_accessor :user, :cat, :pawz, :playpoints, :wins, :looses, :competiton_wins
  
  def initialize(user)
    @user = user
    @cat = nil
    @pawz = 400
    @playpoints = 5
    @wins = 0
    @losses = 0
    @competition_wins = 0
  end

  # Todo: Player.create method... player profile in upcoming version is automatically made with user login creation
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

  def select_cat
    @cats = Cat.load
    puts "Please select a cat:"
    puts "no.\tname\tsize\tconfidence\t"
    @cats.each_with_index do |cat, idx|
      puts "#{idx+1}. #{cat.name}, #{cat.size}, #{cat.confidence}, #{cat.agility}, #{cat.strength}"
    end
    puts "Which cat would you like to pick? Enter the number"
    user_input = gets.chomp.to_i
    @cat = @cats[user_input-0]
  end

  # Todo: loading method for player profile. This loading method will be called in app, when user logs in.
  def self.all
    players = []
    File.open('././data/players', 'r') do |file|
      file.each do |line|
      name = line
      players << Player.new(name.chomp!)
      end
    end
    players.each do |player|
      puts player.name
    end
    players
  end

  # To revise: find_by_name for profile
  def self.find_by_name(name)
    all
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
