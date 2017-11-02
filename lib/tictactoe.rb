require_relative 'player'
require_relative 'board'
class TicTacToe
  attr_reader :player1, :player2, :game_status, :board
  def initialize(board = Board.new, player1 = Player.new('Hero'), player2 = Player.new('Nemesis'))
    @player1 = player1
    @player2 = player2
    @game_status = 'No Winner'
    @board = board
  end

  def who_won?
    return @game_status = board.game_status if board.victory?
    return @game_status = board.game_status if board.draw?
  end

  def take_turn(player, symbol, row, index)
    return player.place_piece(symbol, row, index) if can_take_turn?(player)
    'Not ye turn laddy'
  end

  private

  def can_take_turn?(player)
    return @last_turn = player unless player.turns > find_opposite(player).turns
    false
  end

  def find_opposite(player)
    [player1, player2].detect { |e| e != player }
  end
end
