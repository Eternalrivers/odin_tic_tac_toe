# For creating players in a game
class Player
  attr_reader :name, :symbol, :slot
  attr_accessor :player_choice

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @player_choice = []
  end

  def player_selection(board)
    loop do
      @slot = gets.chomp
      if board.arr.flatten.include?(@slot)
        player_choice << @slot
        break
      else
        puts 'Invalid input'
        redo
      end
    end
  end
end
