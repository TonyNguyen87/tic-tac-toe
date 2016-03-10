require "./board"
require "./humanplayer"
require "./computerplayer"
require "./game"


# ## MAYBE??

# def greeting
# 		puts
# 		puts "Welcome to Tic Tac Toe"
# 		puts "First to get three in a row wins"
# end

def start
	puts
	puts "Welcome to Tic Tac Toe"
	puts "First player is 'X', Second Player is 'O'"
	puts "First to get three in a row wins"
	puts "Please select game mode"
	puts "1. Player vs Player"
	puts "2. Player vs CPU"
	puts "3. CPU VS CPU"
	choice = gets.chomp.to_i
	player1_piece = choose_piece(player1)
		if 
			choice == 1
			player1 = Humanplayer.new("X") 
			player2 = Humanplayer.new("O")
		elsif 
			choice == 2
			player1 = Humanplayer.new("X")
			player2 = ComputerPlayer.new("O")
		else
			choice == 3
			player1 = ComputerPlayer.new("X")
			player2 = ComputerPlayer.new("O")
		end
	choice
	board = Board.new
  Game.new(player1, player2, board)
end

player1 = HumanPlayer.new 
player2 = HumanPlayer.new
board = Board.new
game = Game.new(player1, player2, board)
game.play

