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

def randarray(n)
  return Array.new(n) do rand(10000) end
end

def bench
  t1 = Process.times.utime
  yield
  t2 = Process.times.utime
  return t2 - t1
end