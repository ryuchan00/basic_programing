def min(a)
  min = a[0]
  a.each_index do |i|
    if min > a[i] then
      min = a[i]
    end
  end
  return min
end

def minpos(a)
  min = a[0]; pos = 0
  a.each_index do |i|
    if min > a[i] then
      min = a[i]
      pos = i
    end
  end
  return pos
end

def swap(a, i, j)
  x = a[i]
  a[i] = a[j]
  a[j] = x
end

def bubblesort(a)
  done = false
  while !done do
    done = true
    0.step(a.length - 2) do |i|
      if a[i] > a[i + 1] then
        swap(a, i, i + 1); done = false
      end
    end
  end
end

a = [1, 9, 5, 4, 2]
bubblesort(a)
p a

def randarray(n)
  return Array.new(n) do
    rand(10000)
  end
end

p randarray 10

def arrayminrange(a, i, j)
  min = i
  (i..j).each do |k|
    min = k if a[min] > a[k]
  end
  return min
end

def selectionsort(a)
  a.each_index do |i|
    min = arrayminrange(a, i, a.size - 1)
    swap(a, i, min)
  end
  return a
end

p arrayminrange([100, 2, 5, 10], 1, 3)
p selectionsort([100, 5, 4, 10, 1])