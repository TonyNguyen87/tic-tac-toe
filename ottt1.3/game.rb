require "pry"

class Game

WINS = [[1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7]]
        
	def initialize(player1, player2, board)
		@player_1 = player1
		@player_2 = player2
		@board = board
		# @take_turn = 0
	end
	# binding.pry

	# def greeting
	# 	puts
	# 	puts "Welcome to Tic Tac Toe"
	# 	puts "First to get three in a row wins"
	# end

	def board
		board = @board.board
	end

	def win?
  		WINS.any? do |x, y, z|
    	@board[x - 1] == @board[y - 1] && @board[y - 1] == @board[z - 1]
  		end
	end

	def draw?
		@board.all? { |piece| piece.is_a?(String) }
	end

	def game_over?
		win? || draw?
	end

	def switch_player(current_player)
		current_player == @player_1 ? @player_2 : @player_1
	end

	def play
		@board.display_board
		current_player = @player1
		binding.pry
		until game_over?
			move = current_player.take_turn(@board)
			@board[move] = current_player.piece
			current_player = switch_player(current_player)
		end
		postmortem
	end

end