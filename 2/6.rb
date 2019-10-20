def prime(n)
  return false if n == 1
  return true if n == 2
  return false if n % 2 == 0
  i = 3
  while n / 2 + 1 > i
    return false if n % i == 0
    i += 2
  end
  true
end

# 素数である
puts prime(2)
puts prime(3)
# 素数ではない
puts prime(4)
# 1も素数ではない
puts prime(1)
# 大きい素数
puts prime(20190523)

require 'benchmark'
puts "time: #{Benchmark.realtime { prime(20190523) }}s"
puts "time: #{Benchmark.realtime { prime(20190522) }}s"