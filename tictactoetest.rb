require "set"
require "pry"

board = [1,2,3,4,5,6,7,8,9]

WINS = [[1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [3,5,7]]

MAX_TURNS = 9

def display_board(board)
  puts "
    #{board[0]} | #{board[1]} | #{board[2]}
    -- --- --
    #{board[3]} | #{board[4]} | #{board[5]}
    -- --- --
    #{board[6]} | #{board[7]} | #{board[8]}
    "
end

def greeting
	puts
	puts "WELCOME TO TIC TAC TOE"
	puts "FIRST PLAYER IS X"
	puts "SECOND PLAYER IS O"
	puts "PLAYER ONE GOES FIRST"
end


def available_moves(board)
  board.select { |piece| piece.is_a?(Fixnum) }
end

def take_turn(board, current_player, turn_count)
	display_board(board)
	puts "Player #{current_player} Enter a number from the board to place your piece"
	number = gets.chomp.to_i
	until available_moves(board).include?(number)
    	puts "Please choose an availble number from the board."
    	number = gets.chomp.to_i
	end
	number  
end

def turns_left(turn_count)
	MAX_TURNS - turn_count
end

def draw?(turn_count)
	turns_left(turn_count).zero?
end

def win?(board, current_positions)
  WINS.any? do |x, y, z|
    board[x - 1] == board[y - 1] && board[y - 1] == board[z - 1]
  end
end

def game_over(board, current_positions, turn_count)
	win?(board, current_positions) || draw?(turn_count)
end

def place_piece(choice, board, current_player)
	board.map! do |number|
		if number == choice
		  current_player
		else
		  number
		end
	end	
end

def cpu_turn(board)
	available_moves(board).sample.to_i
end

def tictactoe(board)
	turn_count = 0
	p1 = "X"
	p2 = "O"	
	p1_progress = Set.new
	p2_progress = Set.new
	greeting
	current_player = 1
	current_positions = p1_progress
	until game_over(board, current_positions, turn_count)
			choice = take_turn(board, current_player, turn_count)
			place_piece(choice, board, current_player)
			current_positions.add(choice)
		else current_player == 1
      		current_player = p2
      		current_positions = p2_progress
      		puts "Its the CPUs turn."
      		choice = cpu_turn(board)
      		place_piece(board, current_positions, turn_count)
      		current_positions.add(choice)
      	end
      	turn_count += 1
	end
	if current_player == p1
	  	current_player = p2
    else
     	current_player = p1
    end	
	postmortem(board, current_positions, current_player)
end

def postmortem(board, current_positions, current_player)
	if win?(board, current_positions)
		display_board(board)
		puts "CONGRATULATIONS YOU WIN #{current_player}"
	else
		display_board(board)
		puts "ITS A DRAW"
	end
end

tictactoe(board)
