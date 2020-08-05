# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

class Logic
  attr_accessor :arr, :sym
  def initialize(arr, sym)
    @arr = arr
    @sym = sym
    @checks = [@arr[0..2], @arr[3..5], @arr[6..8],
               [@arr[0], @arr[3], @arr[6]],
               [@arr[1], @arr[4], @arr[7]],
               [@arr[2], @arr[5], @arr[8]],
               [@arr[0], @arr[4], @arr[8]],
               [@arr[2], @arr[4], @arr[6]]]
    checking
  end

  def checking
    if equal_subarr(@checks[0], @sym) ||
       equal_subarr(@checks[1], @sym) ||
       equal_subarr(@checks[2], @sym) ||
       equal_subarr(@checks[3], @sym) ||
       equal_subarr(@checks[4], @sym) ||
       equal_subarr(@checks[5], @sym) ||
       equal_subarr(@checks[6], @sym) ||
       equal_subarr(@checks[7], @sym)
      true
    else
      false
    end
  end

  def equal_subarr(subarr, sym)
    return true if subarr.all? { |x| x == sym }
  end
end

logic = Logic.new(%w[♥ ♥ ♥ d e f g h i], '♥')
p logic.checking()

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
