class Grid
  attr_accessor :row_a, :row_b, :row_c
  def initialize
    @row_a = [nil, nil, nil]
    @row_b = [nil, nil, nil]
    @row_c = [nil, nil, nil]
  end

  def row_query(index = nil)
    return [row_a[index], row_b[index], row_c[index]] if index
    [row_a, row_b, row_c]
  end

  def every_letter_the_same(line)
    line.all? { |letter| letter.class == String && letter == line[0] }
  end

  def place_symbol(row, index, symbol)
    return row[index] = symbol unless row[index].class == String
    false
  end

  def occupied_space(row, index)
    row[index].class == String
  end

  def win_check
    win_conditions = [check_every_horizontal_row_for_winner, check_every_vertical_row_for_winner,
                      check_every_diagonal_for_winner]
    win_conditions.any? { |result| return result if result.class == String }
  end

  def draw?
    return row_query.all? { |row| occupied_space(row, 0) && occupied_space(row, 1) && occupied_space(row, 2) }
    false
  end

  private

  def check_every_horizontal_row_for_winner
    row_query.any? { |row| return row.first if every_letter_the_same(row) }
    false
  end

  def check_every_vertical_row_for_winner
    all_columns = row_query(0), row_query(1), row_query(2)
    all_columns.any? { |column| return column[all_columns.index(column)] if every_letter_the_same(column) }
    false
  end

  def check_every_diagonal_for_winner
    first_diagonal = [row_a[0], row_b[1], row_c[2]]
    second_diagonal = [row_c[0], row_b[1], row_a[2]]
    return row_b[1] if every_letter_the_same(first_diagonal)
    return row_b[1] if every_letter_the_same(second_diagonal)
    false
  end
end
