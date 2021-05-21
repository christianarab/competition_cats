require_relative ('cat.rb')

# Player belongs to user. Each player will have the feature to have, pick, and select cats for competition.
# Players will have currency (pawz) to purchase upgrades for their cats to be used in games. They will start with 400pawz.
# Players tokens will determine how many games the User can enter. By default, players start with 5 - equal to 5 games.
# Players will automatically save and load according to their game outcomes, point usage, etc.
# Todo: add cat selection flow, ability to view cats at hand
class Player
  attr_accessor :user, :cat, :pawz, :tokens, :wins, :losses, :competition_wins
  
  def initialize(user)
    @user = user
    @cat = nil
    @pawz = 400
    @tokens = 5
    @wins = 0
    @losses = 0
    @competition_wins = 0
  end

  def select_cat
    @cats = Cat.load
    puts "Please select a cat:"
    puts "no.\t\tname\t\tsize\t\tconfidence\t\tagility\t\tstrength\n"
    @cats.each_with_index do |cat, idx|
      puts "#{idx+1}.\t\t#{cat.name}\t\t#{cat.size}\t\t#{cat.confidence}\t\t\t#{cat.agility}\t\t#{cat.strength}"
    end
    puts "Which cat would you like to pick? Enter the number"
    user_input = gets.chomp.to_i
    @cat = @cats[user_input-1]
  end

  # Todo: save load and load method
  def self.save(profile)
    File.open('././data/profile', 'a') do |file|
      file.write("#{profile.user.email}, #{profile.pawz}, #{profile.tokens}, #{profile.wins}, #{profile.losses}, #{profile.competition_wins}\n")
    end
  end

  def find_by_user(user)
  end

  def all
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

  # Todo : Add to_s for good measure
  def to_s
  end
end
