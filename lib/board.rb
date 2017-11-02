class Board
  attr_reader :row_a, :row_b, :row_c, :game_status
  def initialize
    @row_a = [nil, nil, nil]
    @row_b = [nil, nil, nil]
    @row_c = [nil, nil, nil]
    @game_status = nil
  end

  def place_symbol(symbol, row, index)
    raise 'Occupied' if row[index].class == String
    row[index] = symbol
    row
  end

  def victory?
    check_every_horizontal_row_for_winner.class == String || check_every_vertical_row_for_winner.class == String || check_every_diaganol_for_winner.class == String
  end

  def draw?
    row_a.each{|x| x != nil}
    row_b.each{|x| x != nil}
    row_b.each{|x| x != nil}
  end

  def game_status
    return @game_status = "Win for #{check_every_horizontal_row_for_winner}" if check_every_horizontal_row_for_winner
    return @game_status = "Win for #{check_every_vertical_row_for_winner}" if check_every_vertical_row_for_winner
    return @game_status = "Win for #{check_every_diaganol_for_winner}" if check_every_diaganol_for_winner
  end

  private

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
    if row_a[0] && row_b[0] && row_c[0]
      row_a[0]
    elsif row_a[1] && row_b[1] && row_c[1]
      row_a[1]
    elsif row_a[2] && row_b[2] && row_c[2]
      row_a[2]
    end
  end

  def check_every_diaganol_for_winner
    row_a[0] && row_b[1] && row_c[2] || row_a[2] && row_b[1] && row_c[0]
  end


end
