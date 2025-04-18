# For starting a game
class Game
  attr_accessor :game_won

  def initialize(player1, player2)
    @board = Board.new
    @current_player = 0
    @player = [player1.new('Player_1', 'X'), player2.new('Player_2', 'O')]
    @game_won = false
    @lines = [%w[1 2 3], %w[4 5 6], %w[7 8 9], %w[1 4 7], %w[2 5 8], %w[3 6 9],
              %w[1 5 9], %w[3 5 7]]
  end

  def other_player
    1 - @current_player
  end

  def switch_players
    @current_player = other_player
  end

  def current_player
    @player[@current_player]
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
    puts @board.create_board

    until @game_won == true
      game_turn(@board, current_player)
      puts "Game Over! #{current_player.name} won the game!" if check_lines?(current_player.player_choice.sort)
      i += 1
      break if @game_won == true || i == 9

      switch_players
    end
    puts "Game Over! It's a draw!" if @game_won == false
  end
end
