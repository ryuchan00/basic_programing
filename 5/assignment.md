基礎プログラミングおよび演習レポート ＃05
学籍番号:1920031
氏名:山川竜太郎
ペア学籍番号・氏名(または「個人作業」):個人情報
提出日付:2019/11/17

[課題の再掲]

演習4 どの図形でもよいが、色を塗る際に、単色で単純に塗るのでなく、次のような塗り方ができるようにしてみよ。
a. 例題の「任意角度の切り取り」は難しいので、簡単にXY軸に沿った 1/4 円を切り取ってみる。
b. ストライプ、ボーダー、チェックなどで塗れるようにする。

[実施したこととその結果]

# 演習4a

## 作成したプログラム

テキストの例題に手を加えて、以下のプログラムを作成した

```
Pixel = Struct.new(:r, :g, :b)
$img = Array.new(200) do
  Array.new(300) do
    Pixel.new(255, 255, 255)
  end
end

def pset(x, y, r, g, b)
  if 0 <= x && x < 300 && 0 <= y && y < 200
    $img[y][x].r = r; $img[y][x].g = g; $img[y][x].b = b
  end
end

def writeimage(name)
  open(name, "wb") do |f|
    f.puts("P6\n300 200\n255")
    $img.each do |a|
      a.each do |p|
        f.write(p.to_a.pack("ccc"))
      end
    end
  end
  return true
end

def fillcircle2(x0, y0, rad, r = 0, g = 0, b = 0)
  200.times do |y|
    300.times do |x|
      if (x - x0) ** 2 + (y - y0) ** 2 <= rad ** 2
        unless x > x0 && y < y0
          pset(x, y, 255, 0, 0)
        end
      end
    end
  end
end

# 演習4a
def mypicture4a
  fillcircle2(100, 120, 80)
  writeimage(__FILE__.match(%{(^.*).rb})[1] + "_circle3.ppm")
end
```

このプログラムは、例題を参考にしており、mypicture4aメソッドで、円の中心地点と半径を指定して、fillcircle2メソッドにて円の座標を打っている。fillcircle2メソッドの特徴として、円の右上1/4が欠けている円が描画されることである。

## 実行例

```
irb(main):055:0> load '5/write_image.rb'
=> true
irb(main):056:0> mypicture4a
=> true
```

mypicture4aメソッドが実行すると、このプログラムが格納されているディレクトリに「ファイル名+_circle3.ppm」というファイルを出力する。この場合は「5/write_image.ppm」になる。ファイルの中身は1/4が切り取られた円が格納される。

# 演習4b

## 作成したプログラム

```
Pixel = Struct.new(:r, :g, :b)
$img = Array.new(200) do
  Array.new(300) do
    Pixel.new(255, 255, 255)
  end
end

def pset(x, y, r, g, b)
  if 0 <= x && x < 300 && 0 <= y && y < 200
    $img[y][x].r = r; $img[y][x].g = g; $img[y][x].b = b
  end
end

def writeimage(name)
  open(name, "wb") do |f|
    f.puts("P6\n300 200\n255")
    $img.each do |a|
      a.each do |p|
        f.write(p.to_a.pack("ccc"))
      end
    end
  end
  return true
end

def fillcircle(x0, y0, rad, r = 0, g = 0, b = 0)
  200.times do |y|
    300.times do |x|
      if (x - x0) ** 2 + (y - y0) ** 2 <= rad ** 2
        if block_given? then
          yield x, y
        else
          pset(x, y, r, g, b)
        end
      end
    end
  end
end

def stripe(x0, y0, rad, r = 0, g = 0, b = 0)
  fillcircle(100, 120, 80) do |x, y|
    if x % 10 > 4
      pset(x, y, 0, 255, 0)
    else
      pset(x, y, 255, 255, 255)
    end
  end
end

def border(x0, y0, rad, r = 0, g = 0, b = 0)
  fillcircle(100, 120, 80) do |x, y|
    if y % 10 > 4
      pset(x, y, 0, 255, 0)
    else
      pset(x, y, 255, 255, 255)
    end
  end
end

def check(x0, y0, rad, r = 0, g = 0, b = 0)
  fillcircle(100, 120, 80) do |x, y|
    if x % 10 > 4 || y % 10 > 4
      if x % 10 > 4 && y % 10 > 4
        pset(x, y, 0, 255, 0)
      else
        pset(x, y, 0, 200, 0)
      end
    else
      pset(x, y, 0, 0, 0)
    end
  end
end


# 演習4b
def mypicture4b
  stripe(100, 120, 80)
  writeimage(__FILE__.match(%{(^.*).rb})[1] + "_stripe.ppm")
  border(100, 120, 80)
  writeimage(__FILE__.match(%{(^.*).rb})[1] + "_border.ppm")
  check(100, 120, 80)
  writeimage(__FILE__.match(%{(^.*).rb})[1] + "_check.ppm")
end
```

例題で定義したメソッドに、ストライプの円を出力するstripeメソッド、ボーダーの円を出力するborderメソッド、チェック柄の円を出力するcheckメソッド、今まで上げた3つの円を出力するmypicture4bメソッドを追加で定義した。

## 実行例

```
irb(main):051:0> load '5/write_image.rb'
=> true
irb(main):052:0> mypicture4b
=> true
```

前述した演習4aと同じ使用方法をする。ファイルの命名規則も同様である。相違点は、ファイルの名の末尾の文字がストライプは「_stripe.ppm」、ボーダーは「_border.ppm」、チェック柄は「_check.ppm」になるということだ。

[考察]

# 演習4a

例題のwriteimageメソッドは、最後にPixelオブジェクトが返ってくる仕組みになっていたため、例外が発生しなければtrueを返すように修正した。理由は、irbにPixelオブジェクトの中身が表示され、過去のメソッドの実行履歴がトレースしづらくなるためである。この課題の本質は円の1/4をどのように判定するかである。私はテキストのヒントより次のように実装するべきだと判断した。x軸は、半分の領域を判断する。y軸は、半分の領域を判断する。このx軸とy軸の単体の二つの円を思い浮かべる。この2つの円の集合積を思い浮かべると円の1/4の部分が対象領域になる。つまりその部分を欠けさせることができることで、円の1/4を欠けることが実現できると考えた。したがって今回はx > x0の領域でかつy < y0の領域のand条件の否定がtrueのときは円の領域を塗り潰さないように実装した。

# 演習4b

ストライプは例題のヒントより次のように考えた。円を縦に10pixelの幅を1つとして考える。10pixelのうち5pixelごとに色を変更すれば10pixelの中には2つの色が存在することになる。実装として実現するには「if x % 10 > 4」の判定は、x軸が0から4までは緑を打ち出す、5から9は白を打ち出してあげれば良い。結果として、ヒントを参考に実装したところ予想通りうまくいった。ボーダーはx軸からy軸に判定を変更すれば良いだけなので、「if x % 10 > 4」を「if y % 10 > 4」に変更した。チェック柄に関してはこの二つを組み合わせばうまくいきそうだと判断した。問題は実装者がチェック柄とはどのような柄だと定義するかである。私は黒の円にx軸とy軸それぞれに緑の線を引く。その緑の円が交差したところは濃い緑にした方が良いと考えた。イメージとしてはテーブルクロスなどのチェック柄をイメージした。判定文はまず「if x % 10 > 4 || y % 10 > 4」にてx軸、y軸のどちらか0から4の範囲であるかを判定、次にネストして「if x % 10 > 4 && y % 10 > 4」を判定して、x軸とy軸の交点かを判定する。その場合は濃い緑を、そうでない場合は緑を打ち出すことにする。そのようにすればチェック柄が表現できると思ったが、実際にやってみると思い通りにうまくいった。

[アンケート]
Q1. 簡単なものなら自分が思った画像が作れますか。
丸や四角、正三角形を10まで組みわせた画像なら頑張れば作れそうだと思いました。

Q2. うまく画像を作り出すコツは何だと思いますか。
まず設計だと思います。紙の方眼紙などでどこに座標を打てばいいのか検討をつけることが大切だと思います。頭の中にイメージできないものは作成できないので。

Q3. リフレクション(今回の課題で分かったこと)・感想・要望をどうぞ。
arctanを用いた円の切り抜きの理解が難しいので、総合課題を通じて理解していこうと思います。どちらかといえば、演習4c以降の問題の方が考察が書きやすかったと後悔しています。しかし時間がないので今回はこの2問にしました。また時間さえ許せば講評にコードレビューをしていただきたいなとは思いました。