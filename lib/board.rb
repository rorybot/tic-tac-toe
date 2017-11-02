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
    return row
  end

  def victory?
    check_every_horizontal_row_for_winner.class == String || check_every_vertical_row_for_winner.class == String || check_every_diaganol_for_winner.class == String
  end

  def draw?
    row_a.each{|x| x != nil} && row_b.each{|x| x != nil} && row_b.each{|x| x != nil}
  end

  def game_status
    return @game_status = "Win for #{check_every_horizontal_row_for_winner}" if check_every_horizontal_row_for_winner
    return @game_status = "Win for #{check_every_vertical_row_for_winner}" if check_every_vertical_row_for_winner
    return @game_status = "Win for #{check_every_diaganol_for_winner}" if check_every_diaganol_for_winner
    # return @game_status = "Draw" if draw?
    return @game_status
  end

  # private

  def check_every_horizontal_row_for_winner
    if row_a == %w[X X X] || row_a == %w[O O O]
      row_a.first
    elsif row_b == %w[X X X] || row_b == %w[O O O]
      row_b.first
    elsif row_c == %w[X X X] || row_c == %w[O O O]
      row_c.first
    end
  end

  def check_every_vertical_row_for_winner
    left_column = [row_a[0],row_b[0], row_c[0]]
    return row_a[0] if left_column.all?{|letter| letter == left_column[0]}
    middle_column = [row_a[1],row_b[1],row_c[1]]
    return row_a[1] if middle_column.all?{|letter| letter == middle_column[0]}
    right_column = [row_a[2],row_b[2], row_c[2]]
    return row_a[2] if right_column.all?{|letter| letter == right_column[0]}
  end

  def check_every_diaganol_for_winner

    first_diagonal = [row_a[0],row_b[1], row_c[2]]
    return row_b[1] if first_diagonal.all?{|letter| letter == first_diagonal[0]}

    second_diagonal = [row_a[2],row_b[1],row_c[0]]
    return row_b[1] if second_diagonal.all?{|letter| letter == second_diagonal[0]}
  end


end
