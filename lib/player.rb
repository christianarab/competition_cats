require_relative ('cat.rb')

# Player belongs to user. Each player will have the feature to have, pick, and select cats for competition.
# Players will have currency (pawz) to purchase upgrades for their cats to be used in games. They will start with 400pawz.
# Players tokens will determine how many games the User can enter. By default, players start with 5 - equal to 5 games.
# Players will automatically save and load according to their game outcomes, point usage, etc.
class Player
  attr_accessor :user, :cat, :pawz, :tokens, :wins, :losses, :competition_wins
  
  def initialize(user, pawz=400, tokens=5, wins=0, losses=0, competition_wins=0)
    @user = user
    @pawz = pawz
    @tokens = tokens
    @wins = wins
    @losses = losses
    @competition_wins = competition_wins
    @cat = nil
  end

  # Instantiates computer profile.
  def self.computer
    @cats = Cat.load
    computer = Player.new(User.new("Computer","Password"), pawz=400, tokens=5, wins=0, losses=0, competition_wins=0)
    computer.cat = @cats[rand(0..3)]
    computer
  end

  # Selects cat by email account
  def select_cat(email)
    @cats = Cat.load

    if File.file?("./data/#{email}_cat")
      f = File.open("./data/#{email}_cat", 'r') 
      name, size, energy, confidence, agility, strength = f.readlines[0].split(", ")
      @cat = Cat.new(name, size.to_s, energy.to_i, confidence.to_i, agility.to_i, strength.to_i)
    else
      puts "No cat found!"
      puts "Please select a cat:"
      puts "no.\t\tname\t\tsize\t\tconfidence\t\tagility\t\tstrength\n"
      @cats.each_with_index do |cat, idx|
        puts "#{idx+1}.\t\t#{cat.name}\t\t#{cat.size}\t\t#{cat.confidence}\t\t\t#{cat.agility}\t\t#{cat.strength}"
      end
      user_input = gets.chomp.to_i
      @cat = @cats[user_input-1]
    end
  end

  def self.save(player)
    File.open("./data/#{player.user.email}", 'w') do |file|
      file.write("#{player.user.email}, #{player.pawz}, #{player.tokens}, #{player.wins}, #{player.losses}, #{player.competition_wins}\n")
    end
    File.open("./data/#{player.user.email}_cat", 'w') do |file|
      file.write("#{player.cat.name}, #{player.cat.size}, #{player.cat.energy}, #{player.cat.confidence}, #{player.cat.agility}, #{player.cat.strength}\n")
    end                     
  end

  def self.login(user, email)
    f = File.open("./data/#{email}")
    email, pawz, tokens, wins, losses, competition_wins = f.readlines[0].split(",")
    player = Player.new(user, pawz.to_i, tokens.to_i, wins.to_i, losses.to_i, competition_wins.to_i)
  end

  # Greeting messages according to hour of day
  def self.greet
    def self.range
      if Time.now.hour < 12
        "morning"
      elsif Time.now.hour < 17
        "afternoon"
      elsif Time.now.hour < 21
        "evening"
      else
        "night"
      end
    end

    greetings = {
      "morning" => "Meow! Morning! I want a can of tuna.",
      "afternoon" => "Good after noon whiskers.",
      "evening" => "Good evening, purrrrrrrrr",
      "night" => "Meow time for some catnip and bed"
    }
    
    "#{greetings[range]}\n"
  end

  def to_s
    "user.email: #{@user.email}, paw points: #{@pawz}, tokens: #{@tokens}, wins: #{@wins}, losses: #{@losses}, competition wins: #{@competition_wins}"
  end
end
