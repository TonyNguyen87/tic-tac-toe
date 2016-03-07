require "pry"

class Board
	def initialize
		@board = (1..9).to_a
	end

	def board
		@board
	end

	def display_board
 		 puts "
    #{board[0]} | #{board[1]} | #{board[2]}
    -- --- --
    #{board[3]} | #{board[4]} | #{board[5]}
    -- --- --
    #{board[6]} | #{board[7]} | #{board[8]}
    "
	end
	
	def available_moves
		@board.select { |piece| piece.is_a?(Fixnum) }
		# binding.pry

	end	
end