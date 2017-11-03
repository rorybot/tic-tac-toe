# require_relative 'grid'
#
# class BoardLogic
#   attr_reader :row_a, :row_b, :row_c, :grid
#   def initialize(grid = Grid.new)
#     @row_a = grid.row_a
#     @row_b = grid.row_b
#     @row_c = grid.row_c
#     @grid = grid
#   end
#
#   # def place_symbol(row, index, symbol)
#   #   return grid.place_symbol(row, index, symbol) unless grid.occupied_space(row, index)
#   #   false
#   # end
#
#   def return_winner_string
#     grid.win_check
#   end
#
#
# end
