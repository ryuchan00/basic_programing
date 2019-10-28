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

def primes(n)
  primes = %w()
  1.upto(n) do |i|
    if prime(i)
      primes << i
    end
  end
  return primes
end

# puts primes(11)
puts primes(99991)
