require_relative 'grid'

class BoardLogic
  attr_reader :row_a, :row_b, :row_c, :grid
  def initialize(grid = Grid.new)
    @row_a = grid.row_a
    @row_b = grid.row_b
    @row_c = grid.row_c
    @grid = grid
  end

  def place_symbol(row, index, symbol)
    return grid.place_symbol(row, index, symbol) unless grid.occupied_space(row, index)
    false
  end

  def return_winner_string
    grid.win_check.any? { |result| return result if result.class == String }
    false
  end

  def draw?
    return grid.row_query.all? { |row| grid.occupied_space(row, 0) && grid.occupied_space(row, 1) && grid.occupied_space(row, 2) }
    false
  end
end
