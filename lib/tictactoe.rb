
class TicTacToe
  attr_reader :player1, :game_status, :board, :last_turn
  def initialize(board = Board.new, player1 = 'Hero', player2 = 'Nemesis')
    @player1 = player1
    @player2 = player2
    @game_status = 'No Winner'
    @board = board
    @last_turn = nil
  end

  def who_won?
    return @game_status = board.game_status if board.victory?
    return @game_status = board.game_status if board.draw?
  end

  def take_turn(player)
    return @last_turn = player unless last_turn == player
    return false
  end


end
