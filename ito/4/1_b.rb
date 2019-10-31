def array01(n)
   a = Array.new(n, 0)
    ((n/2).floor).step(n - 1, 1) do |i| a[i] = 1 end
   return a
end
