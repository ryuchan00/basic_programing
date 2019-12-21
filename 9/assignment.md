基礎プログラミングおよび演習レポート ＃09
学籍番号:1920031
氏名:山川竜太郎
ペア学籍番号・氏名(または「個人作業」):個人
提出日付:2019/12/22

[課題の再掲]
演習2
c. 「最大2つ覚える」機能を持つクラスMemory2。put(x)で新しい内容を記憶させ、getで取り出す。2回取り出すと2回目はより古い内容が出てくる。取り出した値は忘れる。覚えている以上に取り出すと nil が返る。

演習3 有理数クラスをそのまま打ち込んで動かせ。動いたら、四則の他の演算も追加し、動作を確認せよ。できれば、これを用いて浮動小数点では正確に行えない「実用的な」計算が正確にできることを確認してみよ。

[実施したこととその結果]
## 演習2c

Memory2クラスを実装した。@numbersインスタンス変数で、putメソッドによって与えられた値を保持しておき、それが2よりも大きくなったら、先頭から削除するようにした。

```ruby
class Memory2
  def initialize
    @numbers = []
  end

  def put(x)
    @numbers.shift if @numbers.size >= 2
    @numbers.push(x)
    return x
  end

  def get
    return @numbers.pop
  end
end
```

```ruby
irb(main):065:0> m2 = Memory2.new
=> #<Memory2:0x00007f8acc8dc238 @numbers=[]>
irb(main):066:0> m2.put(1)
=> 1
irb(main):067:0> m2.put(3)
=> 3
irb(main):068:0> m2.put(5)
=> 5
irb(main):069:0> m2.get
=> 5
irb(main):070:0> m2.get
=> 3
irb(main):071:0> m2.get
=> nil
irb(main):072:0> m2.put(7)
=> 7
irb(main):073:0> m2.put(9)
=> 9
irb(main):074:0> m2.get
=> 9
irb(main):075:0> m2.put(11)
=> 11
irb(main):076:0> m2.get
=> 11
irb(main):077:0> m2.get
=> 7
irb(main):078:0> m2.get
=> nil
```

## 演習3

例題のRatioクラスに対して、加法以外の四則演算を追加した。メソッド呼び出し方法についても+メソッドと同じである。

```ruby
class Ratio
  def initialize(a, b = 1)
    @a = a
    @b = b
    if b == 0 then
      @a = 1
      return
    end
    if a == 0 then
      @b = 1
      return
    end
    if b < 0 then
      @a = -a
      @b = -b
    end
    g = gcd(a.abs, b.abs)
    @a = @a / g
    @b = @b / g
  end

  def getDivisor
    return @b
  end

  def getDividend
    return @a
  end

  def to_s
    return "#{@a}/#{@b}"
  end

  def +(r)
    c = r.getDividend
    d = r.getDivisor
    return Ratio.new(@a * d + @b * c, @b * d) # a/b+c/d = (ad+bc)/bd
  end

  def -(r)
    c = r.getDividend
    d = r.getDivisor
    return Ratio.new(@a * d - @b * c, @b * d) # a/b-c/d = (ad-bc)/bd
  end

  def *(r)
    c = r.getDividend
    d = r.getDivisor
    return Ratio.new(@a * c, @b * d) # a/b*c/d = (a*c)/b*d
  end

  def /(r)
    c = r.getDividend
    d = r.getDivisor
    return Ratio.new(@a * d, @b * c)
  end

  def gcd(x, y)
    while true do
      if x > y
        x = x % y
        if x == 0
          return y
        end
      else
        y = y % x
        if y == 0
          return x
        end
      end
    end
  end
end
```

```ruby
irb(main):002:0> a = Ratio.new(3, 5)
=> #<Ratio:0x00007fcbfa8539f0 @a=3, @b=5>
irb(main):003:0> a
=> #<Ratio:0x00007fcbfa8539f0 @a=3, @b=5>
irb(main):007:0> b = Ratio.new(8, 7)
=> #<Ratio:0x00007fcbf9109880 @a=8, @b=7>
irb(main):008:0> b
irb(main):015:0> puts a + b
61/35
=> nil
irb(main):016:0> puts a - b
-19/35
=> nil
irb(main):017:0> puts a * b
24/35
=> nil
irb(main):018:0> puts a / b
21/40
=> nil
```

[考察]
## 演習2c

### メソッドの設計

インスタンス変数は、2個まで値を記録すれば良いので、最初は二つのインスタンス変数を定義すればいいのかと思ったが、今まで習ったことを生かすのであれば配列を利用した方が変数の宣言が一つで済むのでそのように実装した。putメソッドでは、すでに配列のサイズが2以上だった場合は配列の先頭の要素を削除してから、末尾に要素を追加するようにした。それにより短くて読みやすいコードが書けた。内部の処理的にキューを知っている人だったら理解しやすいようにした。

### 結果について

テキスト通りにやってみて、同じになるかを確認するようにした。結果として同じように出力された。やはりこの上記の設計方針で問題はなかった。

## 演習3

### メソッドの設計

例題で行った+メソッドに準拠した形にしたいと考えた。なぜなら四則演算のメソッドは+メソッドの内部の処理を少しだけ変えればうまく実装できると思ったからだ。-メソッドについては、+メソッドの+されている部分を-に変更すれば良いというのはすぐに分かった。乗算と除算はその考えは使用できないので、考えを変える必要がある。乗算については、挙動を日本語で説明すると、「分子同士を掛け算して、分母同士を掛け算する」という計算方法である。したがって実装するなら、そのようにするのがベストだった。続いて除算であるが、これは乗算の応用を考えた。具体的には、「割る数の分子分母を入れ替えて乗算する」ということだ。そのように実装すれば問題ないと考えた。実行結果を見る限る問題なく実装できていた。ただしテストケースを増やすのであればもしかしたら抜け漏れがある可能性がある。ただし今回は時間の関係上、そこまでテストすることは控える。


[アンケート]
Q1. クラス定義が書けるようになりましたか。
少しだけ書けるようになりました。

Q2. オブジェクト指向について納得しましたか。
少しだけ納得しました。

Q3. リフレクション(今回の課題で分かったこと)・感想・要望をどうぞ。
やはりプログラミングは難しいです。