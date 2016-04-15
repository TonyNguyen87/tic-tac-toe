require "./board"
require "./humanplayer"
require "./computerplayer"
require "./game"

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
		if  choice == 1
			player1 = HumanPlayer.new("X") 
			player2 = HumanPlayer.new("O")
		elsif 
			choice == 2
			player1 = HumanPlayer.new("X")
			player2 = ComputerPlayer.new("O")
		else
			choice == 3
			player1 = ComputerPlayer.new("X")
			player2 = ComputerPlayer.new("O")
		end
	choice
	board = Board.new
  game = Game.new(player1, player2, board)
  game.play
  play_again?
end

def play_again?
	puts "Would you like to play again? Y/N"
	choice = gets.chomp.to_s.upcase
	until choice == ["y", "n"].include?
		puts "Please choose Y or N"
		input = gets.chomp.upcase		
		if choice == "Y"
			start
		else
			exit
		end
	end
end

start
# player1 = HumanPlayer.new 
# player2 = HumanPlayer.new
# board = Board.new
# game = Game.new(player1, player2, board)
# game.play

