require './lib/logic'

describe Logic do
    let(:array_row) { %w[♥ ♥ ♥ d e f g h i]}
    let(:array_column) { %w[♥ b c ♥ e f ♥ h i]}
    let(:array_diagonal) { %w[▩ b c d ▩ f g h ▩]}
    let(:array_noteql) { %w[a b c d e f g h i]}
    let(:empty_array)  {[]}
    let(:heart) {'♥'}
    let(:square) { '▩' }

    describe '#checking' do
     let(:logic1) { Logic.new(array_row, heart) } 
     let(:logic2) { Logic.new(array_column, heart) }
     let(:logic3) { Logic.new(array_noteql, heart) }
     let(:logic4) {Logic.new(array_diagonal, square)}
     let(:logic5) {Logic.new(empty_array, heart)}
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
     it 'return false if empty array' do
      expect(logic5.checking).to eql(true)
     end
end
end

