Cell = Struct.new(:data, :next)
p = Cell.new(1, Cell.new(2, Cell.new(3, nil)))

def listsum(p)
  sum = 0
  while p != nil do
    sum += p.data
    p = p.next
  end
  return sum
end


p listsum(p)

def listcat(p)
  linked_string = ''
  while p != nil do
    linked_string += p.data.to_s
    p = p.next
  end
  return linked_string
end

p listcat(p)

def listcatrev(p)
  datas = []
  while p != nil do
    datas.push(p.data.to_s)
    p = p.next
  end
  return datas.reverse.join
end

p listcatrev(p)

def printmany(p)
  count = 0
  while p != nil do
    count += 1
    puts(p.data.to_s * count)
    p = p.next
  end
end

printmany(p)

def listoddsum(p)
  sum = 0
  while p != nil do
    sum += p.data
    break if p.next.nil?
    p = p.next.next
  end
  return sum
end

p = Cell.new(1, Cell.new(2, Cell.new(3, nil)))
p listoddsum(p)
p = Cell.new(1, Cell.new(2, nil))
p listoddsum(p)

p = Cell.new(1, Cell.new(2, Cell.new(3, nil)))

def ltoa(p)
  cells = []
  while p != nil do
    cells.push(p)
    p = p.next
  end
  return cells
end

pp ltoa(p)
