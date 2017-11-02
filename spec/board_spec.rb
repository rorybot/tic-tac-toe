describe Board do
  describe 'initialisation' do
    let(:board){Board.new}
      it 'has three arrays' do
        expect(board.row_a.class).to eq Array
        expect(board.row_b.class).to eq Array
        expect(board.row_c.class).to eq Array
      end

  end

  describe 'place some pieces' do
    let(:board){Board.new}
      it 'can place things on the board' do
        expect(board.place_symbol('X', board.row_a, 0)).to eq ['X', nil, nil]
      end

      it 'can place things on the board' do
        expect(board.place_symbol('X', board.row_a, 0)).to eq ['X', nil, nil]
        expect(board.place_symbol('X', board.row_a, 1)).to eq ['X', 'X', nil]
        expect(board.place_symbol('X', board.row_a, 2)).to eq ['X', 'X', 'X']
        expect(board.row_a).to eq ['X', 'X', 'X']
      end
  end
end
