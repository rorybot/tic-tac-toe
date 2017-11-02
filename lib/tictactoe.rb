
class TicTacToe
  attr_reader :player1, :game_status, :board
  def initialize(board = Board.new, player1 = 'Hero', player2 = 'Nemesis')
    @player1 = player1
    @player2 = player2
    @game_status = nil
    @board = board
  end

  def query_game_status
    who_won? if winner?
  end

  private

  def winner?
    board.victory?
  end

  def who_won?
    @game_status = board.game_status if board.victory?
    return game_status
  end
end
