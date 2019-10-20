def integ2(a, b, n)
  dx = (b - a).to_f / n
  s = 0.0
  n.times do |i|
    x = a + (i + 1) * dx
    y = x ** 2        #関数f(x)の計算
    s = s + y * dx
  end
  return s
end
