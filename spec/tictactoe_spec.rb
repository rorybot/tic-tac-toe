require 'tictactoe'

describe TicTacToe do
  describe 'initialisation' do
    it 'has a player 1 with a name' do
      tictactoe = TicTacToe.new
      expect(tictactoe.player1.name).to eq 'Hero'
    end
  end

  describe 'playing a game' do
    let(:board_logic) { double('BoardLogicLogic', victory?: true, game_status: 'Win for X', draw?: false, return_winner_string: 'X') }
    it 'can declare a victory from a horizontal row' do
      tictactoe = TicTacToe.new(board_logic)
      expect(tictactoe.who_won?).to eq 'Win for X'
    end
  end

  describe 'winning a game' do
    let(:board_logic) { double('BoardLogic', victory?: true, game_status: 'Win for X', draw?: nil, return_winner_string: 'X') }
    it 'can declare a victory from a horizontal row' do
      tictactoe = TicTacToe.new(board_logic)
      expect(tictactoe.who_won?).to eq 'Win for X'
    end
  end

  describe 'drawing a game' do
    let(:board_logic) { double('BoardLogic', victory?: false, game_status: 'Draw', draw?: true, return_winner_string: false) }
    it 'can declare a draw' do
      tictactoe = TicTacToe.new(board_logic)
      expect(tictactoe.who_won?).to eq 'Draw'
    end
  end

  describe 'taking turns' do
    let(:player1) { double('Player1', turns: 1, place_piece: nil) }
    let(:player2) { double('Player2', turns: 0, place_piece: 'You have played a turn') }
    let(:tictactoe) { TicTacToe.new(BoardLogic.new, player1, player2) }
    it 'player 2 can take a turn' do
      expect(tictactoe.take_turn(player2, 'x', 'x', 'x')).to eq 'You have played a turn'
    end
    it 'wont let you player 1 play two in a row' do
      tictactoe.take_turn(player1, 'x', 'x', 'x')
      expect(tictactoe.take_turn(player1, 'x', 'x', 'x')).to eq 'Not ye turn laddy'
    end

    it 'wont let player 1 overwrite player2' do
      # tictactoe.take_turn(player1, 'x', 'x', 'x')
      # expect(tictactoe.take_turn(player1, 'x', 'x', 'x')).to eq 'Not ye turn laddy'
    end
  end
end
