require "pry"
require "set"

require "./human"
require "./game"
require "./counting"
require "./random"
require "./smart"


# binding.pry

game = Game.new(200, SmartPlayer.new) #<--- Dependency Injection
game.play

# binding.pry