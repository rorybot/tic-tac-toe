describe Board do
  describe 'initialisation' do

    let(:board){Board.new}

    it 'has three arrays' do
      expect(board.row_a.class).to eq Array
      expect(board.row_b.class).to eq Array
      expect(board.row_c.class).to eq Array
    end

    it 'can place things on the board' do
      expect(board.place_symbol('X', board.row_a, 0)).to eq ['X', nil, nil]
    end
  end
end
