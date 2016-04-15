class Board

WINS = [[1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7]]
        
	def initialize
		@space = (1..9).to_a
	end

	def place_piece(current_player, move)
		position = move -= 1
		@space[position] = current_player.piece
	end

	def available_moves
		@space.select { |piece| piece.is_a?(Fixnum) }
	end	
	
	def display_board
 		 puts "
    #{@space[0]} | #{@space[1]} | #{@space[2]}
    -- --- --
    #{@space[3]} | #{@space[4]} | #{@space[5]}
    -- --- --
    #{@space[6]} | #{@space[7]} | #{@space[8]}
    "
	end


	def win?
  		WINS.any? do |x, y, z|
    	@space[x - 1] == @space[y - 1] && @space[y - 1] == @space[z - 1]
  		end
  	end

	def draw?
		@space.all? { |piece| piece.is_a?(String) }
	end

	def game_over?
		win? || draw?
	end

end

