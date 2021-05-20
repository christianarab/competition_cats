require_relative('./tests/my_tests.rb')
require_relative('./lib/user.rb')
require_relative('./lib/cat.rb')
require_relative('./lib/player.rb')
require_relative('./lib/playfight.rb')
require_relative('./lib/againstmice.rb')
require_relative('./lib/competition.rb')
require_relative('./lib/menu.rb')
require_relative('./lib/pawz.rb')

class App
  @@session = {}
 
  def self.login
    puts "Enter your email: "
    email = gets.chomp
    puts "Enter your password: "
    password = gets.chomp
    @@session['user'] = User.login(email, password)
  end

  def self.run
    puts "Running Competition Cats!"
    # default_user = Player.new("Default")
    while true do
      puts MENU
      user_input = gets.chomp

      case user_input
      when 'q'
        break
      when 'l'
        App.login
      when 'c'
        Cat.create_cat
      when '1'
        Againstmice.run
      when 'l'
        Player.all
      when '2'
        cat1 = Cat.new("kitty monster")
        cat2 = Cat.new("little baby")
        Competition.run(cat1, cat2)
      when 'm'
        Pawz.trade(default_user)
      else
        puts "It broke! ouch"
      end
    end 
  end
end

App.run
