require 'tictactoe'

describe TicTacToe do
  describe 'initialisation' do
    it 'has a player 1 with a name' do
      tictactoe = TicTacToe.new('Rory')
      expect(tictactoe.player1).to eq 'Rory'
    end
  end

  describe 'playing a game' do
    it 'can declare a victory from a horizontal row' do
      tictactoe = TicTacToe.new('Rory')
      expect(tictactoe.horizontal_victory).to eq 'YAY! Three Xs in a row! You win!'
      expect(tictactoe.game_status).to eq 'Win for Player 1'
    end
  end
end
