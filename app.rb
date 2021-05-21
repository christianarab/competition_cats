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
  attr_reader :session

  def self.against_mice_ui
    puts "Paw fight!!!"
    @session['profile'].tokens -= 1
    if Againstmice.run(@session['profile'].cat) == "win"
      @session['profile'].wins += 1
      @session['profile'].tokens += 3
      puts "#{@session['profile'].cat.name} wins!\n"
      puts "#{@session['profile'].cat.name} total wins: #{@session['profile'].wins}\n"
      puts "#{@session['profile'].user.email} recieves 3 more tokens. Game token total: #{@session['profile'].tokens}\n"
      Player.save(@session['profile'])
    else
      puts "You lost! Try again"
      @session['profile'].losses += 1
      Player.save(@session['profile'])
    end
  end

  def self.paw_fight_ui
    puts "Paw fight!!!"
    @session['profile'].tokens -= 1
    if Competition.paw_fight(@session['profile'].cat) == "win"
      @session['profile'].wins += 1
      @session['profile'].tokens += 3
      puts "#{@session['profile'].cat.name} wins!\n"
      puts "#{@session['profile'].cat.name} total wins: #{@session['profile'].wins}\n"
      puts "#{@session['profile'].user.email} recieves 3 more tokens. Game token total: #{@session['profile'].tokens}\n"
      Player.save(@session['profile'])
    else
      puts "You lost! Try again"
      @session['profile'].losses += 1
      Player.save(@session['profile'])
    end
  end

  def self.count_mice_ui
    puts "Paw fight!!!"
    @session['profile'].tokens -= 1
    if Competition.count_mice == "win"
      @session['profile'].wins += 1
      @session['profile'].tokens += 3
      puts "#{@session['profile'].cat.name} wins!\n"
      puts "#{@session['profile'].cat.name} total wins: #{@session['profile'].wins}\n"
      puts "#{@session['profile'].user.email} recieves 3 more tokens. Game token total: #{@session['profile'].tokens}\n"
      Player.save(@session['profile'])
    else
      puts "You lost! Try again"
      @session['profile'].losses += 1
      Player.save(@session['profile'])
    end
  end

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
        @session['login'] = User.login(email, password)
        @session['profile'] = Player.login(@session['login'], email)
        @session['profile'].select_cat
        puts "Your cat is...\n"
        puts "#{@session['profile'].cat}"
        puts "This is your current information:\n"
        puts @session['profile'].to_s
        # TODO: ADD MULTIPLAYER!!!
        puts GAMEMENU
      when 'c'
      # Creates a new user with email and password.
        if @session['login'].instance_of?(User) == true
          puts "#{@session['login'].email} is logged in. Cannot create new account."
        else
        puts "Create a new user!"
        puts "Email address: "
        email = gets.chomp
        puts "Password: "
        password = gets.chomp
        puts "Creating new user..."
        user = User.new(email, password)
        @session['login'] = User.new(email, password)
        @session['profile'] = Player.new(user)
        Player.save(@session['profile'])
        @session['profile'].select_cat
        puts "Your cat is...\n"
        puts "#{@session['profile'].cat}"
        puts "This is your current information:\n"
        puts @session['profile'].to_s
        user.save
          if user.save
            puts "User saved!"
          else
            puts "Something went wrong"
          end
        end
        puts GAMEMENU
      when '1'
        App.against_mice_ui
        puts GAMEMENU
      when '2'
        App.paw_fight_ui
        puts GAMEMENU
      when '3'
        App.count_mice_ui
        puts GAMEMENU
      when 'm'
        puts MENU
      else
        puts "It broke! ouch"
      end
    end 
  end
end

App.run
