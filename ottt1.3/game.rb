require "pry"

class Game

	def initialize(player1, player2, board)
		@player_1 = player1
		@player_2 = player2
		@board = board
	end


	# def switch_player(current_player)
	# 	current_player == @player_1 ? 
	# 	current_player = @player_2 : 
	# 	current_player = @player_1
	# end

	def play
		@board.display_board
		current_player = @player_1
		until @board.game_over?
			move = current_player.take_turn(@board)
			@board.place_piece(current_player, move)
			# switch_player(current_player)
			current_player == @player_1 ? 
			current_player = @player_2 : 
			current_player = @player_1
			@board.display_board
		end
		postmortem(current_player)
	end

	def postmortem(current_player)
		# switch_player(current_player)
		current_player == @player_1 ? 
		current_player = @player_2 : 
		current_player = @player_1
		if @board.win?
		# current_player = switch_player(current_player)
			@board.display_board
			puts "CONGRATULATIONS YOU WIN PLAYER #{current_player.piece}!!"
		else
			@board.display_board
			puts "ITS A DRAW"
		end
	end
end