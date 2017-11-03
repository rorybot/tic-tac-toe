describe Player do
  describe 'placing pieces' do
    let(:player) { Player.new('Hero') }
    let(:board) { double('Board', row_a: [nil, nil, nil]) }
    it 'can place a piece' do
      expect(player.place_piece('X', board.row_a, 0)).to eq 1
    end

    it 'can track turns' do
      player.place_piece('X', board.row_a, 0)
      expect(player.turns).to eq 1
    end
  end
end
