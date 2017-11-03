require_relative 'grid'

class BoardLogic
  attr_reader :row_a, :row_b, :row_c, :grid
  def initialize(grid = Grid.new)
    @row_a = grid.row_a
    @row_b = grid.row_b
    @row_c = grid.row_c
    @grid = grid
  end

  def array_of_potential_wins
    [check_every_horizontal_row_for_winner, check_every_diagonal_for_winner, check_every_vertical_row_for_winner]
  end

  def occupied_space(row, index)
    grid.occupied_space(row, index)
  end

  def place_symbol(row, index, symbol)
    return grid.place_symbol(row, index, symbol) unless grid.occupied_space(row, index)
    false
  end

  def return_winner_string
    [grid.check_every_horizontal_row_for_winner, grid.check_every_vertical_row_for_winner,
     grid.check_every_diagonal_for_winner].any? { |result| return result if result.class == String }
    false
  end
end
