require 'tictactoe'

describe TicTacToe do
  describe 'initialisation' do
    it 'has a player 1 with a name' do
      tictactoe = TicTacToe.new
      expect(tictactoe.player1.name).to eq 'Hero'
    end
  end

  describe 'playing a game' do
    let(:grid) { double('GridLogic', victory?: true, game_status: 'Win for X', draw?: false, return_winner_string: 'X') }
    it 'can declare a victory from a horizontal row' do
      tictactoe = TicTacToe.new(grid)
      expect(tictactoe.who_won?).to eq 'Win for X'
    end
  end

  describe 'winning a game' do
    let(:grid) { double('Grid', victory?: true, game_status: 'Win for X', draw?: nil, return_winner_string: 'X') }
    it 'can declare a victory from a horizontal row' do
      tictactoe = TicTacToe.new(grid)
      expect(tictactoe.who_won?).to eq 'Win for X'
    end
  end

  describe 'drawing a game' do
    let(:grid) { double('Grid', victory?: false, game_status: 'Draw', draw?: true, return_winner_string: false) }
    it 'can declare a draw' do
      tictactoe = TicTacToe.new(grid)
      expect(tictactoe.who_won?).to eq 'Draw'
    end
  end

  describe 'taking turns' do
    let(:player1) { double('Player1', turns: 1, place_piece: 'x', symbol: 'X') }
    let(:player2) { double('Player2', turns: 0, place_piece: 'x', symbol: 'O') }
    let(:grid) { double('Grid', occupied_space: false, place_symbol: true, win_check: false, row_query: Array, draw?: false) }
    let(:tictactoe) { TicTacToe.new(grid, player1, player2) }
    it 'player 2 can take a turn' do
      expect(tictactoe.take_turn(player2, 'x', 'x')).to eq Array
    end
    it 'wont let you player 1 play two in a row' do
      tictactoe.take_turn(player1, 'x', 'x')
      expect(tictactoe.take_turn(player1, 'x', 'x')).to eq 'Not ye turn laddy'
    end
  end

  describe 'trying to overwrite' do
    let(:player1) { double('Player1', turns: 1, place_piece: 'x', symbol: 'X') }
    let(:player2) { double('Player2', turns: 0, place_piece: 'x', symbol: 'O') }
    let(:grid) { double('Grid', occupied_space: true, place_symbol: true, row_a: [nil, nil, nil], win_check: false, draw?: false) }
    let(:tictactoe) { TicTacToe.new(grid, player1, player2) }
    it 'wont let player 1 overwrite player2' do
      tictactoe.take_turn(player1, grid.row_a, 'x')
      expect(tictactoe.take_turn(player1, grid.row_a, 'x')).to eq 'Occupied'
    end
  end
end
