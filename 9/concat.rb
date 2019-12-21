class Concat
  def initialize
    @sentence = ''
  end

  def add(s)
    @sentence += s.to_s
  end

  def get
    @sentence
  end

  def reset
    @sentence = ''
  end
end