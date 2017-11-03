require_relative 'player'
require_relative 'board'
require_relative 'printer'
class TicTacToe
  attr_reader :player1, :player2, :game_status, :board, :printer
  def initialize(board = Board.new, player1 = Player.new('Hero'), player2 = Player.new('Nemesis'))
    @player1 = player1
    @player2 = player2
    @board = board
    @printer = Printer.new
  end

  def who_won?
    return @game_status = printer.announce_victory(board.return_winner) if board.victory?
    return @game_status = printer.draw if board.draw?
  end

  def take_turn(player, symbol, row, index)
    return printer.illegal_move_attempt unless can_take_turn?(player)
    player.place_piece(symbol, row, index)
    printer.turn_played
  end

  private

  def can_take_turn?(player)
    return @last_turn = player unless player.turns > find_opposite(player).turns
  end

  def find_opposite(player)
    [player1, player2].detect { |e| e != player }
  end
end
