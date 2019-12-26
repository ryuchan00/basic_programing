# 例題
Cell = Struct.new(:data, :next)

def nlist1(n)
  p = nil
  n.times do |i|
    p = Cell.new(i, p)
  end
  return p
end

def nlist1_r(n)
  if n <= 0
    return nil
  else
    return Cell.new(n, nlist1_r(n - 1))
  end
end

p nlist1 3
p nlist1_r 3

# 演習2a
def nlist_asc(n)
  p = nil
  n.downto(1) do |i|
    p = Cell.new(i, p)
  end
  return p
end

p nlist_asc 3

# 演習2b
def list_array(a)
  p = nil
  a.reverse_each do |v|
    p = Cell.new(v, p)
  end
  return p
end

p list_array(['a', 'b', 'c'])

p = Cell.new(1, Cell.new(2, Cell.new(3, nil)))
#Cell.new(1, Cell.new(3, nil))

# 演習2c
#def list_delete_even(p)
#  lists = nil
#  while p != nil do
#    list = Cell.new(p.data, nil))
#    if p.next.nil?
#      lists.push = list
#    end
#    list.next =
#    p = p.next.next
#    sum += p.data
#    p = p.next
#  end
#  return lists
#end