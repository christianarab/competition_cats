require_relative('player.rb')

# I hope you are a cat person... or atleast appeciate a cute one because this game is all about cats!
# Cats act as your companions in Competition Cats. Each cat uniquely have both strength and weaknesses.
# Each cat should have a name, size, confidence, agility, strength, and charm traits. These traits effect gameplay.
# Cats are entered into competitions against mutliple human players and/or computer opponents.
# Results of competitions are reflected through wins, looses, ties, and competition wins
class Cat
	attr_reader :size, :agility, :confidence
	attr_accessor :wins, :losses, :energy, :tally, :name, :cats, :competition_wins, :strength

	# Todo: clean up and finalize attributes of cat
	def initialize(name)
		@name = name
		@size = ['small', 'medium', 'large'].sample
		@energy = 100
		@wins = 0
		@losses = 0
		@competition_wins = 0
		@confidence = confidence
		@agility = agility
		@strength = strength
		@tally = 0
		@cats = []
	end

	# Todo: revise create cat. V1 Competition Cats to have cat templates to start by
	def self.create_cat 
		@cats = []
		user_input = ''
		puts "Please name your cat: "
		cat_name = gets.chomp
		cat = Cat.new(cat_name)
		puts "meow meow... meow meow MEOWWWWW"
		puts "meow welcome to the human world #{cat.name}"
		@cats << cat.to_s
end

	# Todo: revise save, creating association to player profile.
	def self.save
		File.open('.././data/cats', 'a') do |file|
			file.write("#{@cats}\n")
		end
	end

	# Agility determined by size of cat
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

	# Strength determined by size of cat
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

	# Todo: revise and impliment pawz marts items. Most items will have time sensitive usage.
	def strength_pawz
		@strength = strength + 300
	end

	# Confidence is determined by previous wins, and losses 
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
