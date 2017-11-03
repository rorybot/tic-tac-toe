describe Board do
  describe 'initialisation' do
    let(:board) { Board.new }
    let(:printer) { double('Printer', occupied_space: 'Occupied') }
    it 'has three arrays' do
      expect(board.board_logic.row_a.class).to eq Array
      expect(board.board_logic.row_b.class).to eq Array
      expect(board.board_logic.row_c.class).to eq Array
    end
  end

  describe 'place some pieces' do
    let(:board) { Board.new }
    it 'can place things on the board' do
      expect(board.place_symbol('X', board.board_logic.row_a, 0)).to eq ['X', nil, nil]
    end

    it 'can place things on the board' do
      (0..2).to_a.each { |i| board.place_symbol('X', board.board_logic.row_a, i) }
      expect(board.board_logic.row_a).to eq %w[X X X]
    end

    it 'cannot place pieces on occupied spaces' do
      board.place_symbol('X', board.board_logic.row_a, 0)
      expect(board.place_symbol('O', board.board_logic.row_a, 0)).to eq false
    end
  end

  describe 'trying for victory' do
    let(:board) { Board.new }
    it 'can declare horizontal_victory for X' do
      (0..2).to_a.each { |i| board.place_symbol('X', board.board_logic.row_a, i) }
      expect(board.victory?).to eq true
      expect(board.return_winner).to eq 'X'
    end

    it 'canNOT declare horizontal_victory for X' do
      board.place_symbol('X', board.board_logic.row_a, 0)
      board.place_symbol('O', board.board_logic.row_a, 1)
      board.place_symbol('X', board.board_logic.row_a, 2)
      expect(board.victory?).to eq false
      expect(board.game_status).to eq 'not finished'
    end

    it 'can declare vertical_victory for X' do
      [board.board_logic.row_a, board.board_logic.row_b, board.board_logic.row_c].to_a.each { |row| board.place_symbol('X', row, 0) }
      expect(board.victory?).to eq true
      expect(board.return_winner).to eq 'X'
    end

    it 'canNOT declare vertical_victory for O' do
      [board.board_logic.row_a, board.board_logic.row_b].to_a.each { |row| board.place_symbol('O', row, 0) }
      board.place_symbol('X', board.board_logic.row_c, 0)
      expect(board.victory?).to eq false
      expect(board.game_status).to eq 'not finished'
    end

    it 'can declare diaganol_victory for X' do
      board.place_symbol('X', board.board_logic.row_a, 0)
      board.place_symbol('X', board.board_logic.row_b, 1)
      board.place_symbol('X', board.board_logic.row_c, 2)
      expect(board.victory?).to eq true
      expect(board.return_winner).to eq 'X'
    end

    it 'canNOT declare diaganol_victory for X' do
      board.place_symbol('X', board.board_logic.row_a, 0)
      board.place_symbol('X', board.board_logic.row_b, 1)
      board.place_symbol('O', board.board_logic.row_c, 2)
      expect(board.victory?).to eq false
      expect(board.game_status).to eq 'not finished'
    end

    it 'can declare a draw ' do
      (0..1).to_a.each { |i| board.place_symbol('X', board.board_logic.row_a, i) }
      board.place_symbol('O', board.board_logic.row_a, 2)
      (0..1).to_a.each { |i| board.place_symbol('O', board.board_logic.row_b, i) }
      board.place_symbol('X', board.board_logic.row_b, 2)
      (0..1).to_a.each { |i| board.place_symbol('X', board.board_logic.row_c, i) }
      board.place_symbol('O', board.board_logic.row_c, 2)
    end
  end
end
