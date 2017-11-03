describe BoardLogic do
  describe 'initialisation' do
    let(:board_logic) { BoardLogic.new }
    let(:printer) { double('Printer', occupied_space: 'Occupied') }
    it 'has three arrays' do
      expect(board_logic.row_a.class).to eq Array
      expect(board_logic.row_b.class).to eq Array
      expect(board_logic.row_c.class).to eq Array
    end
  end

  describe 'place some pieces' do
    let(:board_logic) { BoardLogic.new }
    it 'can place things on the board_logic' do
      expect(board_logic.place_symbol(board_logic.row_a, 0, 'X')).to eq ['X', nil, nil]
    end

    it 'can place a bunch of things on the board_logic' do
      (0..2).to_a.each { |i| board_logic.place_symbol(board_logic.row_a, i, 'X') }
      expect(board_logic.row_a).to eq %w[X X X]
    end

    it 'cannot place pieces on occupied spaces' do
      board_logic.place_symbol(board_logic.row_a, 0, 'X')
      expect(board_logic.place_symbol(board_logic.row_a, 0, 'O')).to eq false
    end
  end

  describe 'trying for victory' do
    let(:board_logic) { BoardLogic.new }
    it 'can declare horizontal_victory for X' do
      (0..2).to_a.each { |i| board_logic.place_symbol(board_logic.row_a, i, 'X') }
      expect(board_logic.return_winner_string).to eq 'X'
    end

    it 'canNOT declare horizontal_victory for X' do
      board_logic.place_symbol(board_logic.row_a, 0, 'X')
      board_logic.place_symbol(board_logic.row_a, 1, 'O')
      board_logic.place_symbol(board_logic.row_a, 2, 'X')
      expect(board_logic.return_winner_string).to eq false
    end

    it 'can declare vertical_victory for X' do
      [board_logic.row_a, board_logic.row_b, board_logic.row_c].to_a.each { |row| board_logic.place_symbol(row, 0, 'X') }
      expect(board_logic.return_winner_string).to eq 'X'
    end

    it 'canNOT declare vertical_victory for O' do
      [board_logic.row_a, board_logic.row_b].to_a.each { |row| board_logic.place_symbol(row, 0, 'O') }
      board_logic.place_symbol(board_logic.row_c, 0, 'X')
      expect(board_logic.return_winner_string).to eq false
    end

    it 'can declare diaganol_victory for X' do
      board_logic.place_symbol(board_logic.row_a, 0, 'X')
      board_logic.place_symbol(board_logic.row_b, 1, 'X')
      board_logic.place_symbol(board_logic.row_c, 2, 'X')
      expect(board_logic.return_winner_string).to eq 'X'
    end

    it 'canNOT declare diaganol_victory for X' do
      board_logic.place_symbol(board_logic.row_a, 0, 'X')
      board_logic.place_symbol(board_logic.row_b, 1, 'O')
      board_logic.place_symbol(board_logic.row_c, 2, 'X')
      expect(board_logic.return_winner_string).to eq false
    end

    it 'can declare a draw ' do
      (0..1).to_a.each { |i| board_logic.place_symbol(board_logic.row_a, i, 'X') }
      board_logic.place_symbol(board_logic.row_a, 2, 'O')
      (0..1).to_a.each { |i| board_logic.place_symbol(board_logic.row_b, i, 'O') }
      board_logic.place_symbol(board_logic.row_b, 2, 'X')
      (0..1).to_a.each { |i| board_logic.place_symbol(board_logic.row_c, i, 'X') }
      board_logic.place_symbol(board_logic.row_c, 2, 'O')
      expect(board_logic.draw?).to eq true
    end

    it 'canNOT declare a draw ' do
      (0..1).to_a.each { |i| board_logic.place_symbol(board_logic.row_a, i, 'X') }
      board_logic.place_symbol(board_logic.row_a, 2, 'O')
      (0..1).to_a.each { |i| board_logic.place_symbol(board_logic.row_b, i, 'O') }
      board_logic.place_symbol(board_logic.row_b, 2, 'X')
      (0..1).to_a.each { |i| board_logic.place_symbol(board_logic.row_c, i, 'X') }
      expect(board_logic.draw?).to eq false
    end
  end
end
