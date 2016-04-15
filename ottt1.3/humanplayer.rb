class HumanPlayer
	def initialize(piece=nil)
		@piece = piece
	end

	def piece
		@piece
	end

	def take_turn(board)
		puts "Please choose an available position from the board"
		choice = gets.chomp.to_i
		moves = board.available_moves
		until moves.include?(choice)
			puts "You have to choose an available position"
			choice = gets.chomp.to_i
		end
		choice
	end
end