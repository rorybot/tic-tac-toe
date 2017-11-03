class Player
  attr_reader :turns, :name
  def initialize(name)
    @turns = 0
    @name = name
  end

  def place_piece
    @turns += 1
  end

  def to_s
    "#{name}"
  end
end
