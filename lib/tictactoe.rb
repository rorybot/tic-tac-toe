require_relative 'player'
require_relative 'grid'
require_relative 'printer'
class TicTacToe
  attr_reader :player1, :player2, :game_status, :grid, :printer
  def initialize(grid = Grid.new, player1 = Player.new('Hero'), player2 = Player.new('Nemesis'))
    @player1 = player1
    @player2 = player2
    @grid = grid
    @printer = Printer.new
  end

  def who_won?
    return @game_status = printer.announce_victory(grid.return_winner_string) if grid.return_winner_string
    return @game_status = printer.draw if grid.draw?
  end

  def take_turn(player, row, index, symbol)
    return printer.illegal_move_attempt unless can_take_turn?(player)
    return printer.occupied_space unless player.place_piece
    return grid.row if grid.place_symbol(row, index, symbol)
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
