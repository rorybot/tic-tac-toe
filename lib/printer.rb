class Printer
  attr_reader :game_status
  def initialize
    @game_status = 'No Winner'
  end

  def illegal_move_attempt
    'Not ye turn laddy'
  end

  def not_finished
    'not finished'
  end

  def occupied_space_warning
    'Occupied'
  end

  def announce_victory(winner)
    "Win for #{winner}"
  end

  def draw
    'Draw'
  end

  def turn_played
    'You have played a turn'
  end

  def occupied_space; end

  def to_s
    game_status.to_s
  end
end
