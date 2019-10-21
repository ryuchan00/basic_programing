def gcd(x, y)
  while x != y
    if x > y
      x = x - y
    else
      y = y - x
    end
  end
  return x
end

puts gcd(10, 15)