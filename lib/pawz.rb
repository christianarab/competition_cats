require_relative('player.rb')
require_relative('cat.rb')
require_relative('menu.rb')

# Pawz is the currency of cats (and their human friends!). Collect pawz points by winning games.
# Spend your pawz on power ups, name changes, and more!
class Pawz
  attr_accessor :pawz

  def pawz_bank
    puts "welcome to the royal bank of pawz"
    puts "have you tried our new pawz eAccount? join today recieve free pawz rewards pawz"
    puts "Your pawz balance: #{player.pawz}"
  end

  def self.trade(player)
    puts "welcome to pawz-mart: the pawz super store"
    puts "meow! what would you like to buy?"
    while true do
      puts PAWMARTMENU
      puts "\n", "\n"
      user_input = gets.chomp
      case user_input
      when 'q'
        break
      when '1'
        # tunashake
        cost = 300
        if player.pawz < cost
          puts "You do not have enough pawz. Play some more games, meow!"
        else
          player.pawz -= 300
          player.cat.strength += 10
          puts "Yum! That's a nice tunashake."
          puts "Your pawz balance: #{player.pawz}"
          puts "Your cat's strength is now: #{player.cat.strength}"
        end
      when '2'
        # catnip tea
        cost = 150
        if player.pawz < cost
          puts "You do not have enough pawz. Play some more games, meow!"
        else
          player.pawz -= 150
          player.cat.confidence += 15
          puts "Farout dude"
          puts "Your pawz balance: #{player.pawz}"
          puts "Your cat's confidence is now: #{player.cat.confidence}"
        end
      when '3'
        # beyondmice burger
        cost = 400
        if player.pawz < cost
          puts "You do not have enough pawz. Play some more games, meow!"
        else
          player.pawz -= 400
          player.cat.strength += 15
          puts "It pays to be ethical"
          puts "Your pawz balance: #{player.pawz}"
          puts "Your cat's strength is now: #{player.cat.strength}"
          player.cat.confidence
        end
      when '4'
        # 5 game tokens
        cost = 450
        if player.pawz < cost
          puts "You do not have enough pawz. Play some more games, meow!"
        else
          player.pawz -= 450
          player.tokens += 5
          puts "Your pawz balance: #{player.pawz}"
          puts "You have #{player.tokens} tokens now."
          player.tokens
        end
      when '5'
        # Cat rename
        cost = 500
        if player.pawz < cost
          puts "You do not have enough pawz. Play some more games, meow!"
        else
          player.pawz -= 500
          puts "Create a new name for your cat:"
          new_name = gets.chomp
          player.cat.name = new_name
          puts "Wow! What a nice name for #{player.cat.name}"
        end
      when 'm'
        break
      else
        puts "It broke! ouch"
      end
    end
  end
end