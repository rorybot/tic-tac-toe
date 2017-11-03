class Player
  attr_reader :turns, :name
  def initialize(name)
    @turns = 0
    @name = name
  end

  def place_piece(_symbol, _row, _index)
    @turns += 1
  end
end
