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

    it 'cannot place pieces on occupied spaces' do
      board.place_symbol('X', board.row_a, 0)
      expect { board.place_symbol('O', board.row_a, 0) }.to raise_error 'Occupied'
    end
  end

  describe 'trying for victory' do
    let(:board) { Board.new }
    it 'can declare horizontal_victory for X' do
      (0..2).to_a.each { |i| board.place_symbol('X', board.row_a, i) }
      expect(board.victory?).to eq true
      expect(board.game_status).to eq 'Win for X'
    end

    it 'canNOT declare horizontal_victory for X' do
     board.place_symbol('X', board.row_a, 0)
     board.place_symbol('O', board.row_a, 1)
     board.place_symbol('X', board.row_a, 2)
      expect(board.victory?).to eq false
      expect(board.game_status).to eq 'not finished'
    end

    it 'can declare vertical_victory for X' do
      [board.row_a, board.row_b, board.row_c].to_a.each { |row| board.place_symbol('X', row, 0) }
      expect(board.victory?).to eq true
      expect(board.game_status).to eq 'Win for X'
    end

    it 'canNOT declare vertical_victory for O' do
      [board.row_a, board.row_b].to_a.each { |row| board.place_symbol('O', row, 0) }
      board.place_symbol('X', board.row_c, 0)
      expect(board.victory?).to eq false
      expect(board.game_status).to eq 'not finished'
    end

    it 'can declare diaganol_victory for X' do
      board.place_symbol('X', board.row_a, 0)
      board.place_symbol('X', board.row_b, 1)
      board.place_symbol('X', board.row_c, 2)
      p board.row_a
      p board.row_b
      p board.row_c
      expect(board.victory?).to eq true
      expect(board.game_status).to eq 'Win for X'
    end

    it 'canNOT declare diaganol_victory for X' do
      board.place_symbol('X', board.row_a, 0)
      board.place_symbol('X', board.row_b, 1)
      board.place_symbol('O', board.row_c, 2)
      p board.row_a
      p board.row_b
      p board.row_c
      expect(board.victory?).to eq false
      expect(board.game_status).to eq 'not finished'
    end

    it 'can declare a draw 'do
      (0..1).to_a.each { |i| board.place_symbol('X', board.row_a, i) }
      board.place_symbol('O', board.row_a, 2)
      (0..1).to_a.each { |i| board.place_symbol('O', board.row_b, i) }
      board.place_symbol('X', board.row_b, 2)
      (0..1).to_a.each { |i| board.place_symbol('X', board.row_c, i) }
      board.place_symbol('O', board.row_c, 2)
      p board.row_a
      p board.row_b
      p board.row_c
    end
  end
end
