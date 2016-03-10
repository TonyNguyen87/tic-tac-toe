class ComputerPlayer
	def initialize(piece=nil)
		@piece = piece
	end

	def piece
		@piece
	end

	def take_turn(available_moves)
		choice = available_moves.sample
		choice
	end
end
