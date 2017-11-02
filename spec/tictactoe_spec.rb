require 'tictactoe'

describe TicTacToe do
  describe 'initialisation' do
    it 'has a player 1 with a name' do
      tictactoe = TicTacToe.new('Rory')
      expect(tictactoe.player1).to eq 'Rory'
    end
  end
end
