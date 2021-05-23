require_relative('./tests/my_tests.rb')
require_relative('./lib/user.rb')
require_relative('./lib/cat.rb')
require_relative('./lib/player.rb')
require_relative('./lib/competition.rb')
require_relative('./lib/menu.rb')
require_relative('./lib/pawz.rb')

class App
  attr_reader :session

  # Login flow, gives option to load a second profile to session hash.
  def self.main_menu_ui
    while true do
      user_input = gets.chomp
      case user_input
      when 'q'
        break
      when 'l'
        App.login_ui
        break
      when 'c'
        if @session['login'].instance_of?(User) == true
          puts "#{@session['login'].email} is logged in. Cannot create new account."
        else
        puts "Creating new user..."
        user = User.create
        @session['login'] = user
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
      end
    end
  end

  def self.login_ui
    puts "Enter your email: "
    email = gets.chomp
    if User.find_by(email).nil?
      puts "Email not found try again"
      login_ui
    else
      puts "Enter your password: "
      password = gets.chomp
      @session['login'] = User.login(email, password)
      @session['profile'] = Player.login(@session['login'], email)
      @session['profile'].select_cat(email)
      puts "Player 1's cat is...\n"
      puts "#{@session['profile'].cat}"
      puts "Player 1 Stats:\n"
      puts @session['profile'].to_s
      puts "Would you like to add player 2? Y/N"
      while true do
        user_input = gets.chomp
        case user_input 
        when 'n'
          break
        when 'y'
          puts "Enter your email: "
          email = gets.chomp
          puts "Enter your password: "
          password = gets.chomp
          @session['login2'] = User.login(email, password)
          @session['profile2'] = Player.login(@session['login2'], email)
          @session['profile2'].select_cat(email)
          puts "Player 2's cat is...\n"
          puts "#{@session['profile2'].cat}"
          puts "Player 2 Stats:\n"
          puts @session['profile2'].to_s
          break
        end
      end
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

  def self.stats_view
    puts "Player 1 Stats:\n"
    puts @session['profile'].to_s
    puts "Player 1's cat is...\n"
    puts "#{@session['profile'].cat}"
    puts "Player 2 Stats:\n"
    puts @session['profile2'].to_s
    puts "Player 2's cat is...\n"
    puts "#{@session['profile2'].cat}"
  end

  def self.run
    @session = {}
    @session['profile2'] = Player.computer
    puts "Running Competition Cats!"
    puts MENU
    App.main_menu_ui
    if @session['profile'].instance_of?(Player) == true
      stats_view
      while true do
        puts GAMEMENU
        user_input = gets.chomp
        case user_input
        when 'q'
          break
        when '1'
          Competition.against_mice_ui(@session['profile'], @session['profile2'])
        when '2'
          Competition.paw_fight_ui(@session['profile'], @session['profile2'])
        when '3'
          Competition.quiz_run(@session['profile'], @session['profile2'])
        when '4'
          Competition.count_mice_run(@session['profile'], @session['profile2'])
        when 'm'
          puts MENU
        when 'p'
          Pawz.trade(@session['profile'])
          Player.save(@session['profile'])
          Player.save(@session['profile2'])
        end
      end
    else
      App.main_menu_ui
    end
  end
end

App.run
