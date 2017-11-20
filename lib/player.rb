class Player
  attr_reader :turns, :name, :symbol, :already_moved
  def initialize(name, symbol = nil)
    @turns = 0
    @name = name
    @symbol = symbol
    @already_moved = nil
  end

  def place_piece
    @turns += 1
  end

  def to_s
    name.to_s
  end

  def set_movement(bool)
    @already_moved = bool
  end
end
