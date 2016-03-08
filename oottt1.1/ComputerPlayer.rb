require "set"
class ComputerPlayer
	def initialize(piece = nil)
		@piece = nil
		@cpu_history = Set.new
	end

	def piece
		@piece
	end

	def take_turn(available_moves)
		choice = available_moves.sample
		@cpu_history.add(choice)
		choice
	end

	def choose_piece
		self
	end

end
