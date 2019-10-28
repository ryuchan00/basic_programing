def primes(n)
  primes = %w()
  primes_evaluate = Array.new(n, false)
  if n > 1
    primes << 2
    1.upto((n / 2).to_i) do |j|
      primes_evaluate[2 * j - 1] = true
    end
  end
  1.upto(n) do |i|
    if i == 1 || primes_evaluate[i - 1]
      next
    end

    prime = true
    primes.each do |p|
      if i % p == 0
        prime = false
        break
      end
    end
    if prime
      primes << i
      1.upto((n / i).to_i) do |j|
        primes_evaluate[i * j - 1] = true
      end
    end
  end
  primes
end

# puts primes(11)
puts primes(99991)
