# Create board for the game
class Board
  attr_accessor :grid, :arr
  attr_reader :slot

  def initialize
    @grid = []
    @arr = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
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

  def player_selection
    puts 'Pick a number designating the slot chosen'
    @slot = gets.chomp
  end

  def board_display(player)
    arr.each do |array|
      if array.include?(slot)
        index = array.find_index(slot)
        array[index] = player.symbol
      end
    end
  end
end
