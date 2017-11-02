require 'tictactoe'

describe TicTacToe do
  describe 'initialisation' do
    it 'has a player 1 with a name' do
      tictactoe = TicTacToe.new(Board.new, 'Rory')
      expect(tictactoe.player1).to eq 'Rory'
    end
  end

  describe 'playing a game' do
    let(:board) { double('Board', victory?: true, game_status: 'Win for X', draw?: false) }

    it 'can declare a victory from a horizontal row' do
      tictactoe = TicTacToe.new(board)
      expect(tictactoe.who_won?).to eq 'Win for X'
    end
  end

  describe 'winning a game' do
    let(:board) { double('Board', victory?: true, game_status: 'Win for X', draw?: nil) }

    it 'can declare a victory from a horizontal row' do
      tictactoe = TicTacToe.new(board)
      expect(tictactoe.who_won?).to eq 'Win for X'
    end
  end

  describe 'drawing a game' do
    let(:board) { double('Board', victory?: false, game_status: 'Draw', draw?: true) }

    it 'can declare a draw' do
      tictactoe = TicTacToe.new(board)
      p board.draw?
      expect(tictactoe.who_won?).to eq 'Draw'
    end
  end

  describe 'taking turns' do
    let(:player1){double('Player1', turns: 1)}
    let(:player2){double('Player2', turns: 0)}
    let(:tictactoe){TicTacToe.new(Board.new, player1, player2)}
    it 'player 2 can take a turn' do
      expect(tictactoe.take_turn(player2)).to eq player2
    end
    it 'wont let you player 1 play two in a row' do
      tictactoe.take_turn(player1)
      expect(tictactoe.take_turn(player1)).to eq false
    end
  end
end
