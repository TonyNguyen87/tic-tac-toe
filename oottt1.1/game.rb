require "pry"

WINS = [[1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7]]

class Game
	def initialize(x_player, o_player, board)
		@x_player = x_player
		@o_player = o_player
		@current_player = @x_player
		@board = board
		# @take_turn = 0
	end
	# binding.pry

	def greeting
		puts
		puts "Welcome to Tic Tac Toe"
		puts "First to get three in a row wins"
	end

	# def board
	# 	board = @board.board
	# end

	def win?(board)
  		WINS.any? do |x, y, z|
    	board[x - 1] == board[y - 1] && board[y - 1] == board[z - 1]
  		end
	end

	def draw?(board)
		board.all? { |piece| piece.is_a?(String) }
	end

	def game_over?(board)
		win?(board) || draw?(board)
	end

	def switch_player
		@current_player == @x_player ? @o_player : @x_player
	end

	def play
		board = @board.board
		available_space = @board.available_moves
		greeting
		@board.display_board
		@current_player.choose_piece
		binding.pry
		until game_over?(board)
			move = @current_player.take_turn
			# binding.pry
			board[move] = @current_player.piece
			@current_player = switch_player
		end
		postmortem
	end

end