require_relative 'board_logic'

class Board
  attr_reader :row_a, :row_b, :row_c, :game_status, :board_logic
  def initialize(board_logic = BoardLogic.new)
    @game_status = 'not finished'
    @board_logic = board_logic
  end

  def place_symbol(symbol, row, index)
    raise 'Occupied' if board_logic.occupied_space(row, index)
    board_logic.place_symbol(row, index, symbol)
  end

  def victory?
    board_logic.array_of_potential_wins.any? { |x| x.class == String }
  end

  def draw?
    row_a.each { |x| !x.nil? } && row_b.each { |x| !x.nil? } && row_b.each { |x| !x.nil? }
  end

  def game_status
    return @game_status = "Win for #{board_logic.if_a_winner_give_me_the_string}" if board_logic.if_a_winner_give_me_the_string
    @game_status
  end
end
