require_relative ('cat.rb')


class Player
    attr_accessor :name, :cat

    def initialize(name)
        @name = name
        @player = []
        @cat = []
    end

    def self.create_cat(player_name='')
        user_input = ''
        if @cat = []
            puts "Player has no cat. Please name your cat:"
            user_input = gets.chomp
            new_cat = Cat.new(user_input)
            puts "meow meow... meow meow MEOWWWWW"
            puts "meow welcome to the human world #{new_cat.name}"
        else
            puts "Player has selected cat"
        end
        puts "Saving profile....!!!!"
        puts self.inspect
        @cat << "#{player_name}=#{new_cat.to_s}"
    end

    def self.show_cat
        puts @cat.inspect
    end

    def self.save
        File.open('./saves/players', 'a') do |file|
            file.write("#{@cat} \n")
        end
    end

    def self.create_user
        puts "create a player!\n"
        puts "would you like to create a new player? (y/n)"
        user_input = gets.chomp
        if user_input == 'y'
            puts "what would you like to name your player? "
            user_input = gets.chomp
            new_player = Player.new(user_input)
            player_name = new_player.name
            puts "meow!! welcome #{player_name}"
            create_cat(player_name)
            show_cat
            save
        elsif user_input == 'n'
        end
    end
end

