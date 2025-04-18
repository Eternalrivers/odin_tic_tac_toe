# For starting a game
class Game
  attr_accessor :game_won

  def initialize(player1, player2)
    @board = Board.new
    @player1 = player1.new('Player_1', 'X')
    @player2 = player2.new('Player_2', 'O')
    @game_won = false
    @lines = [%w[1 2 3], %w[4 5 6], %w[7 8 9], %w[1 4 7], %w[2 5 8], %w[3 6 9],
              %w[1 5 9], %w[3 5 7]]
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

  def play
    i = 0
    player1_slots = @player1.player_choice
    player2_slots = @player2.player_choice
    puts @board.create_board

    until @game_won == true
      game_turn(@board, @player1)
      check_lines?(player1_slots.sort)
      puts 'Game Over! Player 1 won the game!' if @game_won == true
      i += 1
      break if @game_won == true || i == 9

      game_turn(@board, @player2)
      check_lines?(player2_slots.sort)
      puts 'Game Over! Player 2 won the game!' if @game_won == true
      i += 1
    end
    puts "Game Over! It's a draw!" if @game_won == false
  end
end
