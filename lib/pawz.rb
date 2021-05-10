class Pawz

PAWMART = <<-menu
ﾐㅇ ༝ ㅇﾐ PAWMART

    (1)  tunashake (+50 strength for 3 competitions) 
    (2)  catnip tea (+30 confidence for 1 day)
    (3)  beyondmice burger (+100 strength for 1 day)
    
    (q) quit    (m) display menu
menu
        attr_accessor :pawz 

    def initalize(player)
        @player = player
        @pawz = 0
    end

    def pawz_bank
        puts welcome to the pawz
        puts "here is your total paz"
    end

    def self.trade
        puts "welcome to pal-mart: save on pawz"
        puts "meow! what would you like to buy?"
        while true do
            puts PAWMART
            user_input = gets.chomp

            case user_input
            when 'q'
                break
            when '1'
                # tunashake
            when '2'
                # catnip tea
            when '3'
                # beyondmice burger
            when 'm'
            else
                puts "It broke! ouch"
            end
        end 
    end

end