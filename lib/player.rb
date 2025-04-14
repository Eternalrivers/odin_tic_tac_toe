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

  def player_selection
    @slot = nil
    while @slot.nil?
      begin
        puts @slot
        @slot = gets.match(/\d+/)[0]
      rescue StandardError
        puts 'Invalid input. Please input a number'
        redo
      end
      if @slot.to_i > 9 || @slot.to_i < 1
        puts 'Invalid input'
        redo
      else
        @choice = @slot
        player_choice << @slot
      end
    end
  end
end
