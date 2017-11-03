require_relative 'player'
require_relative 'grid'
require_relative 'printer'
class TicTacToe
  attr_reader :player1, :player2, :grid, :printer, :last_turn
  def initialize(grid = Grid.new, player1 = Player.new('Hero'), player2 = Player.new('Nemesis'))
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

  def take_turn(player, row, index, symbol)
    return printer.illegal_move_attempt if last_turn == player
    return printer.occupied_space_warning if grid.occupied_space(row, index)
    log_turn(player)
    grid.place_symbol(row, index, symbol)
    return printer.turn_played
    raise 'WTF'
  end

  private

  def log_turn(player)
    @last_turn = player
  end
end
