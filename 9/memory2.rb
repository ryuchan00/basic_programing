class Memory2
  def initialize
    @numbers = []
  end

  def put(x)
    @numbers.shift if @numbers.size >= 2
    @numbers.push(x)
    return x
  end

  def get
    return @numbers.pop
  end
end