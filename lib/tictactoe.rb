
class TicTacToe
  attr_reader :player1, :player2, :game_status, :board
  def initialize(board = Board.new, player1 = 'Hero', player2 = 'Nemesis')
    @player1 = player1
    @player2 = player2
    @game_status = 'No Winner'
    @board = board
  end

  def who_won?
    return @game_status = board.game_status if board.victory?
    return @game_status = board.game_status if board.draw?
  end

  def take_turn(player)
    can_take_turn?(player)
  end

  # private
  def can_take_turn?(player)
    return @last_turn = player unless player.turns > find_opposite(player).turns
    return false
  end

  def find_opposite(player)
    [player1, player2].detect{|e| e != player}
    #
    # p bob
    # p bob.turns
    # p player
    # p player.turns
  end

end
