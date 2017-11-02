class Board
  attr_reader :row_a, :row_b, :row_c, :game_status
  def initialize
    @row_a = [nil, nil, nil]
    @row_b = [nil, nil, nil]
    @row_c = [nil, nil, nil]
    @game_status = 'not finished'
  end

  def place_symbol(symbol, row, index)
    raise 'Occupied' if row[index].class == String
    row[index] = symbol
    row
  end

  def victory?
    array_of_potential_wins.any? { |x| x.class == String }
  end

  def draw?
    row_a.each { |x| !x.nil? } && row_b.each { |x| !x.nil? } && row_b.each { |x| !x.nil? }
  end

  def game_status
    return @game_status = "Win for #{check_every_horizontal_row_for_winner}" if check_every_horizontal_row_for_winner
    return @game_status = "Win for #{check_every_vertical_row_for_winner}" if check_every_vertical_row_for_winner
    return @game_status = "Win for #{check_every_diaganol_for_winner}" if check_every_diaganol_for_winner
    # return @game_status = "Draw" if draw?
    @game_status
  end

  private

  def array_of_potential_wins
    [check_every_horizontal_row_for_winner, check_every_diaganol_for_winner, check_every_vertical_row_for_winner]
  end

  def check_every_horizontal_row_for_winner
    rows = [row_a, row_b, row_c]
    rows.any? { |row| return row.first if every_letter_in_row_the_same?(row) }
  end

  def every_letter_in_row_the_same?(row)
    row.all? { |letter| letter == row[0] }
  end

  def every_letter_in_column_the_same(column)
    column.all? { |letter| letter == column[0] }
  end

  def check_every_vertical_row_for_winner
    left_column = [row_a[0], row_b[0], row_c[0]]
    middle_column = [row_a[1], row_b[1], row_c[1]]
    right_column = [row_a[2], row_b[2], row_c[2]]
    all_columns = left_column, middle_column, right_column
    all_columns.any?{|column| return column[all_columns.index(column)] if every_letter_in_column_the_same(column)}
  end

  def check_every_diaganol_for_winner
    first_diagonal = [row_a[0], row_b[1], row_c[2]]
    return row_b[1] if first_diagonal.all? { |letter| letter == first_diagonal[0] }

    second_diagonal = [row_a[2], row_b[1], row_c[0]]
    return row_b[1] if second_diagonal.all? { |letter| letter == second_diagonal[0] }
  end
end
