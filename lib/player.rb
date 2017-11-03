class Player
  attr_reader :turns, :name, :symbol
  def initialize(name, symbol = nil)
    @turns = 0
    @name = name
    @symbol = symbol
  end

  def place_piece
    @turns += 1
  end

  def to_s
    name.to_s
  end
end
