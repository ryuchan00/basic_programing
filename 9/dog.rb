class Dog
  def initialize(name)
    @name = name
    @speed = 0.0
    @count = 3
  end

  def talk
    puts "my name is #{@name}"
  end

  def addspeed(d)
    @speed = @speed + d
    puts "speed = #{@speed.to_s}"
  end

  def bark
    @count.times do |i|
      puts 'bark' + ('!' * (i + 1))
    end
  end

  def setcount(n)
    @count = n
  end
end
