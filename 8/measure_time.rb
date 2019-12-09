# 演習1
def bench(count = 1)
  t1 = Process.times.utime
  count.times do
    yield
  end
  t2 = Process.times.utime
  return t2 - t1
end

def square1(n)
  return n * n
end

def pirandom(n)
  count = 0
  n.times do
    x = rand
    y = rand
    if x ** 2 + y ** 2 < 1.0
      count = count + 1
    end
  end
  return 4 * count.to_f / n
end

def sekibun(n)
  count = 0
  n.times do
    x = rand
    y = rand
    if x >= y
      count = count + 1
    end
  end
  return count.to_f / n
end

def sekibun2(n)
  count = 0
  n.times do
    x = rand
    y = rand
    if x ** 2 > y
      count = count + 1
    end
  end
  return count.to_f / n
end

def sekibun3(n)
  count = 0
  a = 4 / 3.to_f
  n.times do
    x = rand * 2
    y = rand
    if x >= y ** 2
      count = count + 1
    end
  end

  p a
  p count
  p n
  return a * count.to_f /  n
end