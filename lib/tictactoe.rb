require_relative 'player'
require_relative 'grid'
require_relative 'printer'
class TicTacToe
  attr_reader :player1, :player2, :grid, :printer, :last_turn
  def initialize(grid = Grid.new, player1 = Player.new('Hero', symbol = 'X'), player2 = Player.new('Nemesis', symbol = 'O'))
    @player1 = player1
    @player2 = player2
    @grid = grid
    @last_turn = nil
    @printer = Printer.new
  end

  def who_won?
    return @game_status = printer.announce_victory(grid.return_winner_string) if grid.return_winner_string
    return @game_status = printer.draw if grid.draw?
  end

  def take_turn(player, row, index)
    return printer.illegal_move_attempt if last_turn == player
    return printer.occupied_space_warning if grid.occupied_space(row, index)
    log_turn(player)
    grid.place_symbol(row, index, player.symbol)
    return printer.announce_victory(grid.win_check) if grid.win_check
    return printer.draw if grid.draw?
    return grid.row_query
    raise 'WTF'
  end

  private

  def log_turn(player)
    @last_turn = player
  end
end
