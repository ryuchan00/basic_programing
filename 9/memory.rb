class Memory
  def initialize
    @num = 0
  end

  def put(n)
    @num = n
  end

  def get
    return @num
  end
end
