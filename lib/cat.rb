require_relative('player.rb')

class Cat
    attr_reader :size, :agility, :strength, :confidence
    attr_accessor :wins, :losses, :energy, :tally, :name, :cat

    def initialize(name)
        @name = name
        @size = ['small', 'medium', 'large'].sample
        @energy = 100
        @wins = 0
        @losses = 0
        @confidence = confidence
        @agility = agility
        @strength = strength
        @tally = 0
    end

    def self.create_cat 
        user_input = ''
        puts "Please name your cat: "
        cat_name = gets.chomp
        meow_made = Cat.new(cat_name)
        puts "meow meow... meow meow MEOWWWWW"
        puts "meow welcome to the human world #{meow_made.name}"
    end
    
    def self.save(cat)
        File.open('./saves/cat', 'a') do |file|
            file.write("#{cat}\n")
        end
    end

    def agility
        base = 50
        case size
        when 'small'
            bonus = 50
        when 'medium'
            bonus = 25
        when 'large'
            bonus = 0
        end
        @agility = base + bonus
    end

    def strength
        base = 50
        case size
        when 'large'
            bonus = 50
        when 'medium'
            bonus = 25
        when 'small'
            bonus = 0
        end
        @strength = base + bonus
    end

    def confidence
        # scale from 1 to 100
        base = 50
        current_confidence = base + (@wins * 2) - (@losses * 2)
        if current_confidence > 100
            return 100
        elsif
            current_confidence < 1
            return 1
        else
            current_confidence
        end        
    end

    def to_s
        "name: #{@name}, size: #{@size}, energy: #{@energy}, agility: #{@agility}, strength: #{@strength}, confidence: #{@confidence}, wins: #{@wins}, losses: #{@losses}"
    end
    
end
