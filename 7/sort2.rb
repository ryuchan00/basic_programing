def shiftlarger(a, i, x)
  (i - 1).downto(0) do |j|
    if a[j] > x
      a[j + 1] = a[j]
      a[j] = nil
    else
      return j + 1
    end
  end
  return 0
end

def insertionsort(a)
  a.each_with_index do |v, k|
    a[shiftlarger(a, k, v)] = v
  end
  return a
end