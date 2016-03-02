class Coffee
	def initialize(coffee)
		@coffee = 9
	end

	def full?
		@coffee == 9
	end

	def empty?
	    @coffee == 0
	end

	def sip
	@coffee	-= 3
	end

end