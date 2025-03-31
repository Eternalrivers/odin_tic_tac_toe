# For creating players in a game
class Player
  attr_reader :name, :symbol, :choice, :player_choice

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @player_choice = []
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

  def player_selection
    puts 'Pick a number designating the slot chosen'
    while @slot.nil? || (@slot == []) || @player_choice.include?(@slot.to_s)
      @slot = gets.match(/\d/)
      puts 'Try Again'
    end
    @choice = @slot.to_s
    @player_choice << @choice
    @slot = []
  end
end
