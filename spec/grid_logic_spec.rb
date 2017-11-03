describe Grid do
  describe 'place some pieces' do
    let(:grid) { Grid.new }

    it 'has three arrays' do
      expect(grid.row_a.class).to eq Array
      expect(grid.row_b.class).to eq Array
      expect(grid.row_c.class).to eq Array
    end

    it 'can declare horizontal_victory for X' do
      grid.row_a = %w[X X X]
      expect(grid.win_check).to eq 'X'
    end

    it 'can place things on the board_logic' do
      expect(grid.place_symbol(grid.row_a, 0, 'X')).to eq 'X'
    end

    it 'can place a bunch of things on the board_logic' do
      (0..2).to_a.each { |i| grid.place_symbol(grid.row_a, i, 'X') }
      expect(grid.row_a).to eq %w[X X X]
    end

    it 'cannot place pieces on occupied spaces' do
      grid.place_symbol(grid.row_a, 0, 'X')
      expect(grid.place_symbol(grid.row_a, 0, 'O')).to eq false
    end

    it 'canNOT declare horizontal_victory for X' do
      grid.place_symbol(grid.row_a, 0, 'X')
      grid.place_symbol(grid.row_a, 1, 'O')
      grid.place_symbol(grid.row_a, 2, 'X')
      expect(grid.win_check).to eq false
    end

    it 'can declare vertical_victory for X' do
      [grid.row_a, grid.row_b, grid.row_c].to_a.each { |row| grid.place_symbol(row, 0, 'X') }
      expect(grid.win_check).to eq 'X'
    end

    it 'canNOT declare vertical_victory for O' do
      [grid.row_a, grid.row_b].to_a.each { |row| grid.place_symbol(row, 0, 'O') }
      grid.place_symbol(grid.row_c, 0, 'X')
      expect(grid.win_check).to eq false
    end

    it 'can declare diaganol_victory for X' do
      grid.place_symbol(grid.row_a, 0, 'X')
      grid.place_symbol(grid.row_b, 1, 'X')
      grid.place_symbol(grid.row_c, 2, 'X')
      expect(grid.win_check).to eq 'X'
    end

    it 'canNOT declare diaganol_victory for X' do
      grid.place_symbol(grid.row_a, 0, 'X')
      grid.place_symbol(grid.row_b, 1, 'O')
      grid.place_symbol(grid.row_c, 2, 'X')
      expect(grid.win_check).to eq false
    end

    it 'can declare a draw ' do
      (0..1).to_a.each { |i| grid.place_symbol(grid.row_a, i, 'X') }
      grid.place_symbol(grid.row_a, 2, 'O')
      (0..1).to_a.each { |i| grid.place_symbol(grid.row_b, i, 'O') }
      grid.place_symbol(grid.row_b, 2, 'X')
      (0..1).to_a.each { |i| grid.place_symbol(grid.row_c, i, 'X') }
      grid.place_symbol(grid.row_c, 2, 'O')
      expect(grid.draw?).to eq true
    end

    it 'canNOT declare a draw ' do
      (0..1).to_a.each { |i| grid.place_symbol(grid.row_a, i, 'X') }
      grid.place_symbol(grid.row_a, 2, 'O')
      (0..1).to_a.each { |i| grid.place_symbol(grid.row_b, i, 'O') }
      grid.place_symbol(grid.row_b, 2, 'X')
      (0..1).to_a.each { |i| grid.place_symbol(grid.row_c, i, 'X') }
      expect(grid.draw?).to eq false
    end
  end
end
