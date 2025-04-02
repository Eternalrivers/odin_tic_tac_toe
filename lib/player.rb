# For creating players in a game
class Player
  attr_reader :name, :symbol, :choice
  attr_accessor :player_choice

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @player_choice = []
  end

  def player_selection
    puts 'Pick a number designating the slot chosen'
    while @slot.nil? || (@slot == []) || @player_choice.include?(@slot.to_s)
      @slot = gets.match(/\d/)
      puts 'Try Again'
    end
    @choice = @slot.to_s
    @player_choice << @choice
    @slot = []
  end
end
