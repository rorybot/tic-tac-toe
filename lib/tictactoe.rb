
class TicTacToe
  attr_reader :player1, :game_status, :board
  def initialize(board = Board.new, player1 = 'Hero', player2 = 'Nemesis')
    @player1 = player1
    @player2 = player2
    @game_status = nil
    @board = board
  end

  def winner?
    @game_status = 'Win for X' if board.horizontal_victory
    return true
  end
end
