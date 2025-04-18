# For starting a game
class Game
  attr_accessor :game_won

  def initialize(player1, player2)
    @board = Board.new
    @player1 = player1.new('Player_1', 'X')
    @player2 = player2.new('Player_2', 'O')
    @game_won = false
  end

  def check_lines?(player_choices)
    return false if player_choices.empty?

    player_choices.combination(3) do |arr|
      @game_won = true if @lines.include?(arr)
    end
    @game_won
  end

  def game_turn(board, player)
    print "\n#{player.name}! Please choose your position: "
    player.player_selection(board)
    board.board_display(player)
    puts board.create_board
  end
end
