require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'

Game.new(Player, Player).play
