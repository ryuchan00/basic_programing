def array01(n)
   a = Array.new(n, 0)
    n.times do |i| a[i] = n - i end
   return a
end
