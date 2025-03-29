# For creating players in a game
class Player
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def self.create_player1
    name = 'player1'
    symbol = 'X'
    Player.new(name, symbol)
  end
end
