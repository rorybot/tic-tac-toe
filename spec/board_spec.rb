describe Board do
  describe 'initialisation' do
    let(:board) { Board.new }
    it 'has three arrays' do
      expect(board.row_a.class).to eq Array
      expect(board.row_b.class).to eq Array
      expect(board.row_c.class).to eq Array
    end
  end

  describe 'place some pieces' do
    let(:board) { Board.new }
    it 'can place things on the board' do
      expect(board.place_symbol('X', board.row_a, 0)).to eq ['X', nil, nil]
    end

    it 'can place things on the board' do
      (0..2).to_a.each { |i| board.place_symbol('X', board.row_a, i) }
      expect(board.row_a).to eq %w[X X X]
    end

    it 'can declare horizontal_victory for X' do
      (0..2).to_a.each { |i| board.place_symbol('X', board.row_a, i) }
      expect(board.horizontal_victory?).to eq true
      expect(board.game_status).to eq 'Win for X'
    end

    it 'can declare horizontal_victory for O' do
      (0..2).to_a.each { |i| board.place_symbol('O', board.row_a, i) }
      expect(board.horizontal_victory?).to eq true
      expect(board.game_status).to eq 'Win for O'
    end

  end
end
