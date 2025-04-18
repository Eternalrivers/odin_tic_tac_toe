# Create board for the game
class Board
  attr_accessor :selected_slots
  attr_reader :arr

  def initialize
    @grid = []
    @arr = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
    @selected_slots = []
  end

  def create_board
    width = 3
    separator_row = Array.new(width + 1, '+').join('-') << "\n"
    cell_row = arr.map { |num| num.join('|').prepend('|') << '|' }

    cell_row.each do |num|
      grid << (separator_row + num)
    end
    grid.append(separator_row)
  end

  def show_players_symbols(player)
    player.symbol
  end

  def board_display(player)
    @grid = []
    arr.each do |array|
      if array.include?(player.slot)
        index = array.find_index(player.slot)
        array[index] = player.symbol
      end
    end
  end

  private

  attr_accessor :grid
end
