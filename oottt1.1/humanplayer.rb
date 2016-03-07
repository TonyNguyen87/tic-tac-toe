require "set"
require "pry"
require "./board"

class HumanPlayer < Board
	def initialize(piece = "N/A")
		@piece = nil
	end

	def piece
		@piece
	end

	def choose_piece
		puts "Please choose a piece 'X'/'O'"
		choice = gets.chomp.upcase
		until ["X", "O"].include?(choice)
			puts "Please choose either 'X'/'O'"
			choice = gets.chomp.upcase
		end
		@piece = choice
	end

	def take_turn
		puts "Please choose an available position from the board"
		choice = gets.chomp.to_i
		# until available_moves.include?(choice)
		# 	puts "You have to choose an available position"
		# 	choice = gets.chomp.to_i
		# end
		choice - 1
	end

end
