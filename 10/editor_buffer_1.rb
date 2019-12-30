class Buffer
  Cell = Struct.new(:data, :next)

  def initialize
    @tail = @cur = Cell.new("EOF", nil)
    @head = @prev = Cell.new("", @cur)
    @index = 0
  end

  def at_top?
    return @prev.data.empty?
  end

  def ateof
    return @cur == @tail
  end

  def top
    @prev = @head
    @cur = @head.next
    @index = 0
  end

  def forward
    if ateof
      return
    end
    @prev = @cur
    @cur = @cur.next
    @index += 1
  end

  def backward
    # curがtopか、現在のリストがheadとtailしか存在しない場合は移動ができない(prevの領域が確保できない)
    if at_top? || (ateof && @prev.data.empty?)
      return
    end
    tmp = @prev.dup
    @cur = @prev
    p = @head.dup
    (@index + 1).times do
      p = p.next
    end
    @prev = p
    @index -= 1
  end

  def reverse
    # curは、今のリストの指し示しているdataに追従する

  end

  def insert(s)
    @prev.next = Cell.new(s, @cur)
    @prev = @prev.next
    @index += 1
  end

  def print
    puts "" + @cur.data
  end

  def delete
    if ateof
      return
    end
    @prev.next = @cur.next
    forward
  end

  def exchange
    if ateof
      return
    end
    tmp = @cur.dup
    @cur.next.next
    tmp.next = @cur.next.next
    @prev.next = @cur.next
    @cur = @cur.next
    @cur.next = tmp
  end
end

e = Buffer.new
e.insert('abc')
e.insert('def')
e.insert('ghi')
e.top
e.print
e.forward
e.print
e.backward
e.print
e.forward
e.print
e.delete
e.print
e.delete # defが消える
e.print # EOF
e.top
e.print
e.exchange
e.print # ghi
