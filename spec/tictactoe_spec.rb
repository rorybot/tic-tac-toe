require 'tictactoe'

describe TicTacToe do
  describe 'initialisation' do
    it 'has a player 1 with a name' do
      tictactoe = TicTacToe.new
      expect(tictactoe.player1 = 'Rory')
    end
  end
end
