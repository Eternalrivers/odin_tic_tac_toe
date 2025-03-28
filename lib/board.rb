# Create board for the game
class Board
  attr_accessor :grid

  def initialize
    @grid = []
  end

  def create_board
    arr = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
    width = 3
    separator_row = Array.new(width + 1, '+').join('-') << "\n"
    cell_row = arr.map { |num| num.join('|').prepend('|') << '|' }

    cell_row.each do |num|
      grid << (separator_row + num)
    end
    puts grid.append(separator_row)
  end
end
