def gcd(x, y)
  # puts "#{x},#{y}"  # 引数をチェックしたい時を使う
  if x == y
    return x
  elsif x > y
    return gcd(x - y, y)
  else
    return gcd(x, y - x)
  enddef binary(n)
    return '0' if n.zero?
    return '1z' if n == 1
    return binary(n / 2) + '0' if n.even?
    return binary(n / 2) + '1' if n.odd?
  end
end

def fact(n)
  return 1 if n == 1
  n * fact(n - 1)
end

def fib(n)
  return 1 if (n.zero? || n == 1)
  fib(n - 1) + fib(n - 2)
end

def comb(n, r)
  return 1 if (r.zero? || r == n)
  comb(n - 1, r) + comb(n - 1, r - 1)
end

