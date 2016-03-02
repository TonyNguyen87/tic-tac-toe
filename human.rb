class Human
	def initialize(name)
		@name = name
		@alertness = 0.03
	end

	def alertness
		@alertness
	end

	def has_coffee?
		false
	end

	def needs_coffee?
		true
	end

	def drink!
		@alertness += 0.3
		@coffee.sip
	end

	def buy(coffee)
		true
		@coffee = coffee
	end

end