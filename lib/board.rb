require_relative 'board_logic'

class Board
  attr_reader :row_a, :row_b, :row_c, :game_status, :board_logic
  def initialize(board_logic = BoardLogic.new)
    @row_a = [nil, nil, nil]
    @row_b = [nil, nil, nil]
    @row_c = [nil, nil, nil]
    @game_status = 'not finished'
    @board_logic = board_logic
    populate(board_logic)
  end

  def place_symbol(symbol, row, index)
    raise 'Occupied' if row[index].class == String
    row[index] = symbol
    row
  end

  def victory?
    board_logic.array_of_potential_wins.any? { |x| x.class == String }
  end

  def draw?
    row_a.each { |x| !x.nil? } && row_b.each { |x| !x.nil? } && row_b.each { |x| !x.nil? }
  end

  def game_status
    return @game_status = "Win for #{board_logic.check_every_horizontal_row_for_winner}" if board_logic.check_every_horizontal_row_for_winner
    return @game_status = "Win for #{board_logic.check_every_vertical_row_for_winner}" if board_logic.check_every_vertical_row_for_winner
    return @game_status = "Win for #{board_logic.check_every_diaganol_for_winner}" if board_logic.check_every_diaganol_for_winner
    # return @game_status = "Draw" if draw?
    @game_status
  end

  private

  def populate(logic)
    board_logic.row_a = row_a
    board_logic.row_b = row_b
    board_logic.row_c = row_c
  end

end
