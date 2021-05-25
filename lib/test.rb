require_relative ('user.rb')
require_relative ('player.rb')
require_relative ('cat.rb')

def setup_users
  temp = {
    "email1@gmail.com" => "computer 1", 
    "email2@gmail.com"=> "computer 2", 
    "email3@gmail.com" => "computer 3",
    "email4@gmail.com"=> "computer 4",
    "email5@gmail.com" => "computer 5", 
    "email6@gmail.com" => "computer 6", 
    "email7@gmail.com" => "computer 7", 
    "email8@gmail.com" => "computer 8", 
  }

  temp.map do |k, v|
     User.new(k, v)
  end
end

@accounts = []
setup_users.each do |user|
  @accounts << Player.new(user, pawz=400, tokens=5, wins=0, losses=0, competition_wins=0)
end

@accounts.map do |account|
  account.cat = Cat.new("Sparky", "large", 100, 50, 50, 50)
end

puts @accounts.inspect