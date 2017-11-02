describe Board do
  describe 'initialisation' do
    it 'has three arrays' do
      board = Board.new()
      expect(board.row_a.class).to eq Array
      expect(board.row_b.class).to eq Array
      expect(board.row_c.class).to eq Array
    end
  end
end
