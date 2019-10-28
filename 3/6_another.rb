def isprime8(a, n)
  # 平方根までしかtrueは存在しない
  limit = Math.sqrt(n).to_i + 1
  a.each do |i|
    if i >= limit then
      a.push(n)
      return true
    end
    if n % i == 0 then
      return false
    end
  end
  a.push(n)
  return true
end

def primes8(n)
  a = []
  2.step(n - 1) do |i|
    if isprime8(a, i) then
      puts(i)
    end
  end
end

primes8(1000000)