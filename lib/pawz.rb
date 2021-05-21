require_relative('player.rb')
require_relative('cat.rb')
require_relative('menu.rb')

class Pawz

  attr_accessor :pawz

  def pawz_bank
    puts "welcome to the royal bank of pawz"
    puts "have you tried our new pawz eAccount? join today recieve free pawz rewards pawz"
    puts "Your pawz balance: #{player.pawz}"
  end

  def self.trade(player)
    puts "welcome to pal-mart: save on pawz"
    puts "meow! what would you like to buy?"
    while true do
      puts PAWMART
      puts "\n", "\n"
      user_input = gets.chomp

      case user_input
      when 'q'
        break
      when '1'
        # tunashake
        player.pawz -= 300
        player.cat.strength + 400
        puts "Yum! That's a nice tunashake."
        puts "Your pawz balance: #{player.pawz}"
        puts "Your cat's strength is now: #{player.cat.strength}"
      when '2'
        # catnip tea
        player.pawz -= 150
        puts "Farout dude"
        puts "Your pawz balance: #{player.pawz}"
      when '3'
        # beyondmice burger
        player.pawz -= 400
        puts "It pays to be ethical"
        puts "Your pawz balance: #{player.pawz}"
      when 'm'
      else
        puts "It broke! ouch"
      end
    end
    return player.pawz 
  end
end