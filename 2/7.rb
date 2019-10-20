def primes(n)
  primes = %w()
  primes << 2 if n > 1
  i = 3
  while n > i
    prime = true
    primes.each do |p|
      if i % p == 0
        prime = false
        break
      end
    end
    primes << i if prime
    i += 2
  end
  primes
end

# なし
puts '1までの素数'
puts primes(1)
# 2,3,4
puts '4までの素数'
puts primes(4)
# 2,3,5,7,11,13
puts '15までの素数'
puts primes(15)

require 'benchmark'

(198_000..210_000).each do |i|
  result = Benchmark.realtime do
    puts primes(i)
  end
  if result > 10
    puts "nの大きさ #{i}"
    puts "処理概要 #{result}s"
    break
  end
end
