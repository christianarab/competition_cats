require_relative('./lib/user.rb')
require_relative('./lib/cat.rb')
require_relative('./lib/player.rb')
require_relative('./lib/competition.rb')
require_relative('./lib/menu.rb')
require_relative('./lib/pawz.rb')
require 'colorize'

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

  # Login sequence. Assign second player session to human.
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

  # View the current stats of session players
  def self.stats_view
    puts "Player 1 Stats:\n".colorize(:blue)
    puts @session['profile'].to_s.colorize(:light_blue)
    puts "\nPlayer 1's cat is...\n".colorize(:blue)
    puts "#{@session['profile'].cat}".colorize(:light_blue)
    puts "\n<:3)~~~~\t\t\t<:3)~~~~\t\t\t<:3)~~~~\n".colorize(:grey)
    puts "\nPlayer 2 Stats:\n".colorize(:red)
    puts @session['profile2'].to_s.colorize(:light_red)
    puts "\nPlayer 2's cat is...\n".colorize(:red)
    puts "#{@session['profile2'].cat}".colorize(:light_red)
  end

  def self.run
    puts String.colors
    @session = {}
    @session['profile2'] = Player.computer # By default, player_2 profile is Computer
    puts "Running Competition Cats!"
    puts MENU.colorize(:orange)
    App.main_menu_ui # Runs Login/Create User/Player 2 selection
    if @session['profile'].instance_of?(Player) == true
      stats_view
      while true do
        puts "#{GAMEMENU}".colorize(:background => :light_black)
        user_input = gets.chomp
        case user_input
        when 'q'
          break
        when '1'
          Competition.against_mice_ui(@session['profile'], @session['profile2'])
          stats_view
        when '2'
          Competition.paw_fight_ui(@session['profile'], @session['profile2'])
          stats_view
        when '3'
          Competition.quiz_run(@session['profile'], @session['profile2'])
          stats_view
        when '4'
          Competition.count_mice_run(@session['profile'], @session['profile2'])
          stats_view
        when '5'
          Competition.competition_mode(@session['profile'], @session['profile2'])
          stats_view
        when 'm'
          puts MENU
        when 'p'
          Pawz.trade(@session['profile'])
          Player.save(@session['profile'])
          Player.save(@session['profile2'])
          stats_view
        end
      end
    else
      App.main_menu_ui
    end
  end
end

App.run
