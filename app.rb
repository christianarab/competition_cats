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
  attr_reader :current_user, :session

  def self.run
    puts "Running Competition Cats!"
    @session = {}
    puts MENU
    while true do
      user_input = gets.chomp

      case user_input
      when 'q'
        break
      when 'l'
        # Todo: (revise) login, (feature) ability to have two users to log in.
        puts "Enter your email: "
        email = gets.chomp
        puts "Enter your password: "
        password = gets.chomp
        @session['p1_login'] = User.login(email, password)
        @session['p1_profile'] = Player.new(@session['p1_login'])
        @session['p1_profile'].select_cat
        puts "Your cat is...\n"
        puts "#{@session['p1_profile'].cat}"
        # Todo: (feature) see line 34 comment in player.rb
        # TODO: ADD MULTIPLAYER!!!
        puts GAMEMENU
      when 'c'
        # Creates a new user with email and password.
        puts "Create a new user!"
        puts "Email address: "
        email = gets.chomp
        puts "Password: "
        password = gets.chomp
        puts "Creating new user..."
        user = User.new(email, password)
        @session['p1_login'] = User.new(email, password)
        @session['p1_profile'] = Player.new(user)
        user.save
        if user.save
          puts "User saved!"
        else
          puts "Something went wrong"
        end
        puts GAMEMENU
      when '1'
        Againstmice.run(@session['p1_profile'])
      when 'l'
        Player.all
      when '2'
        puts "Paw fight!!!"
        @session['p1_profile'].tokens -= 1
        if Competition.paw_fight(@session['p1_profile'].cat) == "win"
        puts "Congrats you have won!"
        @session['p1_profile'].wins += 1
        Player.save(@session['p1_profile'])
        else
        puts "You lost! Try again"
        @session['p1_profile'].losses += 1
        Player.save(@session['p1_profile'])
        end
      when 'm'
        puts MENU
      else
        puts "It broke! ouch"
      end
    end 
  end
end

App.run
