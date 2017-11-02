require 'tictactoe'

describe TicTacToe do
  describe 'initialisation' do
    it 'has a player 1 with a name' do
      tictactoe = TicTacToe.new(Board.new, 'Rory')
      expect(tictactoe.player1).to eq 'Rory'
    end
  end

  describe 'playing a game' do

    let(:board){ double('Board', horizontal_victory: true, game_status: 'Win for X')}

    it 'can declare a victory from a horizontal row' do
      tictactoe = TicTacToe.new(board)
      expect(tictactoe.winner?).to eq true
      expect(tictactoe.game_status).to eq 'Win for X'
    end

    it 'can declare a victory from a horizontal row' do
      tictactoe = TicTacToe.new(board)
      expect(tictactoe.winner?).to eq true
      expect(tictactoe.game_status).to eq 'Win for X'
    end
  end
end
