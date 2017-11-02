class Player
  attr_reader :turns, :name
  def initialize(name)
    @turns = 0
    @name = name
  end

  def place_piece(symbol, row, index)
    @turns +=1
    return 'You have played a turn'
  end
end
