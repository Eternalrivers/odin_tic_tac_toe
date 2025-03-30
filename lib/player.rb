# For creating players in a game
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def self.create_player1
    name = 'player1'
    symbol = 'X'
    Player.new(name, symbol)
  end

  def self.create_player2
    name = 'player2'
    symbol = 'O'
    Player.new(name, symbol)
  end
end
