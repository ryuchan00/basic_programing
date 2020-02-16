def examine(a)
  m = 0.0
  a.each_index do |i|
    m = m + a[i]
  end
  return m
end

p examine([1,2,3])
