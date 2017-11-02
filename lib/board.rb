class Board
  attr_reader :row_a, :row_b, :row_c
  def initialize
    @row_a = [nil,nil,nil]
    @row_b = [nil,nil,nil]
    @row_c = [nil,nil,nil]
  end

  def place_symbol(symbol, row, index)
    row[index] = symbol
    return row
  end
end
