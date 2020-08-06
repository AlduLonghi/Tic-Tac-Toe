require './lib/logic'

describe Logic do
  let(:array_row) { %w[♥ ♥ ♥ d e f g h i] }
  let(:array_column) { %w[♥ b c ♥ e f ♥ h i] }
  let(:array_diagonal) { %w[▩ b c d ▩ f g h ▩] }
  let(:array_noteql) { %w[a b c d e f g h i] }
  let(:heart) { '♥' }
  let(:square) { '▩' }
  let(:logic1) { Logic.new(array_row, heart) }
  let(:logic2) { Logic.new(array_column, heart) }
  let(:logic3) { Logic.new(array_noteql, heart) }
  let(:logic4) { Logic.new(array_diagonal, square) }
  let(:logic5) { Logic.new(empty_array, heart) }
  let(:logic6) { Logic.new(array_row, square) }

  describe '#checking' do
    it 'return true if row cells are equal' do
      expect(logic1.checking).to eql(true)
    end

    it 'return false if row cells are not equal' do
      expect(logic3.checking).to eql(false)
    end

    it 'return true if colums cells are equal' do
      expect(logic2.checking).to eql(true)
    end

    it 'return true if diagonals celles are equal ' do
      expect(logic4.checking).to eql(true)
    end

    it 'return false if cells are equal but sym is not' do
      expect(logic6.checking).to eql(false)
    end
  end

  describe '#equal_subarr' do
    it 'return true if cells are equal' do
      expect(logic1.equal_subarr(array_row[0..2], heart)).to eql(true)
    end

    it 'return nil if cells are not equal' do
      expect(logic3.equal_subarr(array_noteql[0..2], heart)).to eql(nil)
    end
  end
end
