def primes(n)
  primes = %w()
  primes << 2 if n > 1
  i = 3
  while n >= i
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

# puts primes(11)
puts primes(99991)
