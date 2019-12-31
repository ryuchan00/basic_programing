基礎プログラミングおよび演習レポート ＃10
学籍番号:1920031
氏名:山川竜太郎
ペア学籍番号・氏名(または「個人作業」):
提出日付:2019/12/31

[課題の再掲]
演習3 クラスBufferを打ち込み、動作を確認せよ。動いたら、以下の操作(メソッ
ド)を追加してみよ。
c. 1つ前の行に戻る
d. すべての行の順番を逆順にする

[実施したこととその結果]
## 演習3c

### 作成したコード

演習3dと共通である。`backward`メソッドが1つ前の業に戻るメソッドである。

```ruby
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

  def eof
    while !ateof do
      @prev = @cur
      @cur = @cur.next
      @index += 1
    end
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
    @cur = @prev
    p = @head.dup
    (@index + 1).times do
      p = p.next
    end
    @prev = p
    @index -= 1
  end

  def reverse
    # curの位置は先頭に戻る
    top
    p = @cur.dup
    eof
    while p.next != nil do
      @cur = Cell.new(p.data, @cur)
      p = p.next
    end
    @head.next = @cur
    @prev = @head
    @index = 0
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
```

### 実行結果

`forward`メソッドで単連結リストのカーソルを進めた後、前に戻すために`backward`メソッドを実行した。結果より、下記の実行ではカーソルが1つ戻っていた。

```ruby
irb(main):002:0> e = Buffer.new
=> #<Buffer:0x00007f93ae849010 @cur=#<struct Buffer::Cell data="EOF", next=nil>, @tail=#<struct Buffer::Cell data="EOF", next=nil>, @prev=#<struct Buffer::Cell data="", next=#<struct Buffer::Cell data="EOF", next=nil>>, @head=#<struct Buffer::Cell data="", next=#<struct Buffer::Cell data="EOF", next=nil>>, @index=0>
e.insert('abc')
e.insert('def')
e.insert('ghi')irb(main):003:0> e.insert('abc')
=> 1
e.insert('def')
e.insert('ghi')irb(main):004:0> e.insert('def')
=> 2
e.insert('ghi')irb(main):005:0> e.insert('ghi')
=> 3
irb(main):007:0> e.top
=> 0
e.printirb(main):008:0> e.print
abc
=> nil
irb(main):009:0> e.forward
=> 1
irb(main):010:0> e.print
def
=> nil
irb(main):011:0> e.backward
=> 0
irb(main):012:0> e.print
abc
=> nil
```

## 演習3d

### 作成したコード

コードは演習3cに書いたので省略した。`reverse`メソッドが、オブジェクトの単連結リストを逆転させる。ただし先頭とEOFの順番は変更しない。また、メソッド実行時にカーソルは先頭に移動する。`reverse`メソッド内でEOFにカーソルを移動する必要があるので、`eof`メソッドを作成した。

### 実行結果

`reverse`メソッドで単連結リストの順番を逆転させた。また、オブジェクトの中身を実際に見てみて単連結リストの他の要素も順番が逆転したか確認した。

```ruby
irb(main):013:0> e = Buffer.new
=> #<Buffer:0x00007f93ab0d5480 @cur=#<struct Buffer::Cell data="EOF", next=nil>, @tail=#<struct Buffer::Cell data="EOF", next=nil>, @prev=#<struct Buffer::Cell data="", next=#<struct Buffer::Cell data="EOF", next=nil>>, @head=#<struct Buffer::Cell data="", next=#<struct Buffer::Cell data="EOF", next=nil>>, @index=0>
e.insert('abc')
e.insert('def')
e.insert('ghi')irb(main):014:0> e.insert('abc')
=> 1
e.insert('def')
e.insert('ghi')irb(main):015:0> e.insert('def')
=> 2
e.insert('ghi')irb(main):016:0> e.insert('ghi')
=> 3
irb(main):017:0> e.top
=> 0
irb(main):018:0> e.print
abc
=> nil
irb(main):019:0> e.reverse
=> 0
irb(main):020:0> e.print
ghi
=> nil
irb(main):021:0> p e
#<Buffer:0x00007f93ab0d5480 @cur=#<struct Buffer::Cell data="ghi", next=#<struct Buffer::Cell data="def", next=#<struct Buffer::Cell data="abc", next=#<struct Buffer::Cell data="EOF", next=nil>>>>, @tail=#<struct Buffer::Cell data="EOF", next=nil>, @prev=#<struct Buffer::Cell data="", next=#<struct Buffer::Cell data="ghi", next=#<struct Buffer::Cell data="def", next=#<struct Buffer::Cell data="abc", next=#<struct Buffer::Cell data="EOF", next=nil>>>>>, @head=#<struct Buffer::Cell data="", next=#<struct Buffer::Cell data="ghi", next=#<struct Buffer::Cell data="def", next=#<struct Buffer::Cell data="abc", next=#<struct Buffer::Cell data="EOF", next=nil>>>>>, @index=0>
=> #<Buffer:0x00007f93ab0d5480 @cur=#<struct Buffer::Cell data="ghi", next=#<struct Buffer::Cell data="def", next=#<struct Buffer::Cell data="abc", next=#<struct Buffer::Cell data="EOF", next=nil>>>>, @tail=#<struct Buffer::Cell data="EOF", next=nil>, @prev=#<struct Buffer::Cell data="", next=#<struct Buffer::Cell data="ghi", next=#<struct Buffer::Cell data="def", next=#<struct Buffer::Cell data="abc", next=#<struct Buffer::Cell data="EOF", next=nil>>>>>, @head=#<struct Buffer::Cell data="", next=#<struct Buffer::Cell data="ghi", next=#<struct Buffer::Cell data="def", next=#<struct Buffer::Cell data="abc", next=#<struct Buffer::Cell data="EOF", next=nil>>>>>, @index=0>
```

[考察]
## 演習3c

一番最初に考えたことは、メソッドの名前である。例題に存在する`forward`メソッドと対比がある名前にしないと直感的に使用することができないメソッドになってしまう。そのため対義語である`backward`メソッドとした。`backward`メソッドにて1つ前の行に戻ることができない条件を考える必要があった。すでにリストの先頭にいる場合は前に戻ることができないので、リストの先頭か判定するためのメソッド`at_top?`メソッドを定義した。またBufferオブジェクトを生成した直後はリストの要素がないので、その場合も前に戻る操作を行うことができない。従って早期returnして何も操作しないようにした。`backward`メソッドは、@indexにて持っているリストのheadとtail以外の要素の数を持っている。その数値を使用して、@headを先頭から探索していくとカーソルの前の要素が判明する。従ってそれを@prevに代入してあげればよかった。その後@indexをデクリメントして位置を調整した。@indexを持つことによって、配列的にリストを扱うことができ@headを配列としてみた的に現在地を数値で割り出すことができた。ただしリストが循環する場合はこの方法は使用できないことは気をつけた。

## 演習3d

現在のカーソル位置である@curを`reverse`メソッド実行後はどこに移動するかを考えた。@indexを使用すれば移動できそうであるが、考慮することが増えるので、このメソッド内で`top`メソッドを実行して先頭に戻してしまった。単連結リストの順番の逆転の方法は、新しくリストを作り直すことにした。最初はnextを順次変更していく方式にしたが、どうしても実現することができなかった。従って単純に考えてもう一度リストを作り直すことにした。作り直す順番はEOFからリストの前の部分を作成していき、最後にdataが空文字のCellオブジェクトをくっつけるようにした。

[アンケート]
Q1. 何らかの動的データ構造が扱えるようになりましたか。
テキストレベルならなったと思います。

Q2. 複雑な構造をクラスの中にパッケージ化する利点について納得しましたか。
理解しました。

Q3. リフレクション(今回の課題で分かったこと)・感想・要望をどうぞ。
今回も難しかったです。