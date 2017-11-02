class Player
  attr_reader :turns
  def initialize
    @turns = 0
  end

  def place_piece(symbol, row, index)
    @turns +=1
    return 'You have played a turn'
  end
end
