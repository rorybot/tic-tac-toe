class Board
  attr_reader :row_a, :row_b, :row_c, :game_status
  def initialize
    @row_a = [nil,nil,nil]
    @row_b = [nil,nil,nil]
    @row_c = [nil,nil,nil]
    @game_status = nil
  end

  def place_symbol(symbol, row, index)
    row[index] = symbol
    return row
  end

  def horizontal_victory?
    return true if check_every_horizontal_row_for_winner == 'O' || 'X'
  end

  def game_status
    return @game_status = "Win for #{check_every_horizontal_row_for_winner}" if horizontal_victory?
  end

  private

  def check_every_horizontal_row_for_winner
    if row_a == ['X','X','X'] || row_a == ['O','O','O']
      return row_a.first
    elsif row_b == ['X','X','X'] || row_b == ['O','O','O']
      return row_b.first
    elsif row_c == ['X','X','X'] || row_c == ['O','O','O']
      return row_c.first
    end
  end
end
