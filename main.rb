require_relative 'lib/board'
require_relative 'lib/player'

require 'pry-byebug'

@lines = [%w[1 2 3], %w[4 5 6], %w[7 8 9], %w[1 4 7], %w[2 5 8], %w[3 6 9], %w[1 5 9], %w[3 5 7]]

@game_won = false

def check_lines?(player_choices)
  return false if player_choices.empty?

  player_choices.combination(3) do |arr|
    @game_won = true if @lines.include?(arr)
  end
end

@board = Board.new
puts @board.create_board

@player1 = Player.new('Player_1', 'X')
@player2 = Player.new('Player_2', 'O')

player1_slots = @player1.player_choice
player2_slots = @player2.player_choice

def game_turn(board, player)
  player.player_selection
  board.board_display(player)
  puts board.create_board
end
i = 0

until i == 8 || @game_won == true
  game_turn(@board, @player1)
  check_lines?(player1_slots)

  break if @game_won == true

  game_turn(@board, @player2)
  check_lines?(player2_slots)

end

puts 'You won!'
