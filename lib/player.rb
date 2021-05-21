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

  def self.save(profile)
    File.open("././data/#{profile.user.email}", 'a') do |file|
      file.write("#{profile.user.email}, #{profile.pawz}, #{profile.tokens}, #{profile.wins}, #{profile.losses}, #{profile.competition_wins}\n")
    end
  end

  def self.load(email)
    File.open("././data/#{email}", 'a') do |file|
      file.write("#{profile.user.email}, #{profile.pawz}, #{profile.tokens}, #{profile.wins}, #{profile.losses}, #{profile.competition_wins}\n")
    end
  end

  # Todo : Add to_s for good measure
  def to_s
    "user.email: #{@user.email}, paw points: #{@pawz}, tokens: #{@tokens}, wins: #{@wins}, losses: #{@losses}, competition wins: #{@competition_wins}"
  end
end

