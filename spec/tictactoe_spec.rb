require 'tictactoe'

describe TicTacToe do
  describe 'initialisation' do
    it 'has a player 1 with a name' do
      tictactoe = TicTacToe.new(Board.new, 'Rory')
      expect(tictactoe.player1).to eq 'Rory'
    end
  end

  describe 'playing a game' do

    let(:board){ double('Board', victory?: true, game_status: 'Win for X', draw?: nil)}

    it 'can declare a victory from a horizontal row' do
      tictactoe = TicTacToe.new(board)
      expect(tictactoe.query_game_status).to eq 'Win for X'
    end
  end

  describe 'drawing a game' do

    let(:board){ double('Board', victory?: false, game_status: 'Draw', draw?: true)}

    it 'can declare a victory from a horizontal row' do
      tictactoe = TicTacToe.new(board)
      expect(tictactoe.query_game_status).to eq 'Draw'
    end
  end
end
