class ComputerPlayer
	def initialize(piece=nil)
		@piece = piece
	end

	def piece
		@piece
	end

	def take_turn(board)
		choice = board.available_moves.sample
	end


end
