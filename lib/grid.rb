class Grid
  attr_accessor :row_a, :row_b, :row_c
  def initialize
    @row_a = [nil, nil, nil]
    @row_b = [nil, nil, nil]
    @row_c = [nil, nil, nil]
  end

  def row_query(index = nil)
    # return [row_a[i], row_b[i], row_c[i]]if index.class == Array
    return [row_a[index], row_b[index], row_c[index]] if index
    [row_a, row_b, row_c]
  end

  def every_letter_the_same(line)
    line.all? { |letter| letter == line[0] }
  end

  def place_symbol(row,index,symbol)
    row[index] = symbol
    row
  end

  def occupied_space(row,index)
    row[index].class == String
  end

  def check_every_horizontal_row_for_winner
    row_query.any? { |row| return row.first if every_letter_the_same(row) }
  end

  def check_every_vertical_row_for_winner
    all_columns = row_query(0), row_query(1), row_query(2)
    all_columns.any? { |column| return column[all_columns.index(column)] if every_letter_the_same(column) }
  end

  def check_every_diagonal_for_winner
    first_diagonal = [row_a[0], row_b[1], row_c[2]]
    second_diagonal = [row_c[0], row_b[1], row_a[2]]
    return row_b[1] if every_letter_the_same(first_diagonal)
    return row_b[1] if every_letter_the_same(second_diagonal)
  end
end
