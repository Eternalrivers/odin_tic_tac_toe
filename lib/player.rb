# For creating players in a game
class Player
  attr_reader :name, :symbol, :choice
  attr_accessor :player_choice

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @player_choice = []
  end

  def player_selection(board)
    @slot = nil
    while @slot.nil?
      @slot = gets.chomp
      if board.selected_slots.include?(@slot) || !board.arr.flatten.include?(@slot)
        puts 'Invalid input'
        redo
      else
        @choice = @slot
        board.selected_slots << @slot
        player_choice << @slot
      end
    end
  end
end
