require './lib/logic'

describe Logic do
    let(:array_row) { %w[♥ ♥ ♥ d e f g h i]}
    let(:array_column) { %w[♥ b c ♥ e f ♥ h i]}
    let(:array_diagonal) { %w[▩ b c d ▩ f g h ▩]}
    let(:array_noteql) { %w[a b c d e f g h i]}
    let(:heart) {'♥'}
    let(:square) { '▩' }

    describe '#checking' do
     let(:logic1) { Logic.new(array_row, heart) } 
     let(:logic2) { Logic.new(array_column, heart) }
     let(:logic3) { Logic.new(array_noteql, heart) }
     
     it 'return true if row cells are equal' do
      expect(logic1.checking).to eql(true)
     end

     it 'return false if row cells are not equal' do 
      expect(logic3.checking).to eql(false)
    end
end
end

