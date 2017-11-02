class Player
  describe 'placing pieces' do
    let(:player) { Player.new }
    let(:board){ double('Board', row_a: [nil,nil,nil]) }
    it 'can place a piece' do
      expect(player.place_piece('X', board.row_a, 0)).to eq ["X", nil, nil]
    end
  end
end
