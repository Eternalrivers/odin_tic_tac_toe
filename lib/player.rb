# For creating players in a game
class Player
  attr_reader :name, :symbol, :choice
  attr_accessor :player_choice

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @player_choice = []
  end

  # def player_selection
  #   puts 'Pick a number designating the slot chosen'
  #   while @slot.nil? || (@slot == []) || @player_choice.include?(@slot.to_s)
  #     @slot = gets.match(/\d/)
  #   end
  #   @choice = @slot.to_s
  #   @player_choice << @choice
  #   @slot = []
  # end

  def player_selection(board)
    @slot = nil
    while @slot.nil?
      puts @slot
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
