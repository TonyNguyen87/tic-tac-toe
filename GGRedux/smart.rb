require "set"
require "pry"

class SmartPlayer
	def initialize
		@min_guess = 1
		@max_guess = 100
		# @first_guess = 50
		@random = 50
	end

	def get_guess(max, answer)
		# binding.pry
		# @first_guess
		# last_guess = Set.new
		@random
		if answer > @random
			@min_guess = @random
			@random = (@min_guess..@max_guess).to_a.sample
		else
			# binding.pry
			@max_guess = @random
			@random = (@min_guess..@max_guess).to_a.sample
		end
	end
end