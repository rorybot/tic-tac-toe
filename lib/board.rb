require_relative 'board_logic'

class Board
  attr_reader :row_a, :row_b, :row_c, :game_status, :board_logic
  def initialize(board_logic = BoardLogic.new)
    @game_status = 'not finished'
    @board_logic = board_logic
  end

  def place_symbol(symbol, row, index)
    return board_logic.place_symbol(row, index, symbol) unless board_logic.occupied_space(row, index)
    false
  end

  def victory?
    board_logic.array_of_potential_wins.any? { |x| x.class == String }
  end

  def draw?
    row_a.each { |x| !x.nil? } && row_b.each { |x| !x.nil? } && row_b.each { |x| !x.nil? }
  end

  def return_winner
    return board_logic.return_winner_string.to_s if board_logic.return_winner_string
  end
end
