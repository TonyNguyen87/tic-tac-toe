require "pry"

require "./board"
require "./humanplayer"
# require "./computerplayer"
require "./game"

x_player = HumanPlayer.new "X"
o_player = HumanPlayer.new "O"
board = Board.new
# cpu = ComputerPlayer.new
game = Game.new(x_player, o_player, board)

game.play

