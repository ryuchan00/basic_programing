Cell = Struct.new(:data, :next)
p = Cell.new(1, Cell.new(2, Cell.new(3, nil)))
p p
p.next.next = nil
p p
q = Cell.new("A", Cell.new("B", Cell.new("C", nil)))
p q
q.next.next.next = p
p q
p = Cell.new(1, nil)
q = Cell.new("A", Cell.new("B", Cell.new("C", p)))
p.next = q
p p
q.next.next = nil
p p

Cell = Struct.new(:data, :next)

def listlen(p)
  len = 0
  while p != nil do
    len = len + 1
    p = p.next
  end
  return len
end

p = Cell.new(1, Cell.new(2, Cell.new(3, nil)))
p listlen(p)

def printlist(p)
  while p != nil do
    puts(p.data)
    p = p.next
  end
end

printlist(p)

def listlen_r(p)
  if p == nil
    return 0
  else
    return listlen_r(p.next) + 1
  end
end

def printlist_r(p)
  if p !+nil
    puts(p.data)
    printlist_r(p.next)
  end
end

def revprintlist_r(p)
  if p != nil then
    revprintlist_r(p.next); puts(p.data)
  end
end

q = Cell.new("A", Cell.new("B", Cell.new("C", nil)))
revprintlist_r q

