Pixel = Struct.new(:r, :g, :b)
$img = Array.new(200) do
  Array.new(300) do
    Pixel.new(255, 255, 255)
  end
end

def pset(x, y, r = 0, g = 0, b = 0, a = 0.0)
  if x < 0 || x >= 300 || y < 0 || y >= 200 then
    return
  end
  $img[y][x].r = ($img[y][x].r * a + r * (1.0 - a)).to_i
  $img[y][x].g = ($img[y][x].g * a + g * (1.0 - a)).to_i
  $img[y][x].b = ($img[y][x].b * a + b * (1.0 - a)).to_i
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

def fillcircle(x, y, rad, r = 0, g = 0, b = 0, a = 0.0)
  j0 = (y - rad).to_i
  j1 = (y + rad).to_i
  i0 = (x - rad).to_i
  i1 = (x + rad).to_i

  j0.step(j1) do |j|
    i0.step(i1) do |i|
      if (i - x) ** 2 + (j - y) ** 2 < rad ** 2
        if block_given? then
          yield(i, j)
        else
          pset(i, j, r, g, b, a)
        end
      end
    end
  end
end

# rectangleの略
# w:widthの略、幅という意味
# h:heightの略、高さという意味
def fillrect(x, y, w, h, r = 0, g = 0, b = 0, a = 0.0)
  j0 = (y - 0.5 * h).to_i
  j1 = (y + 0.5 * h).to_i
  i0 = (x - 0.5 * w).to_i
  i1 = (x + 0.5 * w).to_i

  j0.step(j1) do |j|
    i0.step(i1) do |i|
      if block_given? then
        yield(i, j)
      else
        pset(i, j, r, g, b, a)
      end
    end
  end
end

# 楕円
def fillellipse(x, y, rx, ry, r = 0, g = 0, b = 0, a = 0.0)
  j0 = (y - ry).to_i
  j1 = (y + ry).to_i
  i0 = (x - rx).to_i
  i1 = (x + rx).to_i

  j0.step(j1) do |j|
    i0.step(i1) do |i|
      if ((i - x).to_f / rx) ** 2 + ((j - y).to_f / ry) ** 2 < 1.0
        if block_given? then
          yield(i, j)
        else
          pset(i, j, r, g, b, a)
        end
      end
    end
  end
end

# --- ここからパックマンの敵、ゴーストを作るためのメソッド集

# 凸型に塗りつぶすメソッド
# 正方形を4つ並べる
# x,yは3辺が正方形に面している正方形の対角線の軸を指定する
#   □
#  □■□ この黒い正方形のこと
def fill_convex(x, y, h, r = 0, g = 0, b = 0, a = 0.0)
  fillrect(x, y, h, h, r, g, b, a)
  # 上
  fillrect(x, y - h, h, h, r, g, b, a)
  # 左
  fillrect(x - h, y, h, h, r, g, b, a)
  # 右
  fillrect(x + h, y, h, h, r, g, b, a)
end

def two_convex(x, y, w, r = 0, g = 0, b = 0, a = 0.0)
  # 足の太さは4px
  2.times do |i|
    # wを二等分して、その中の1/3の部分にxを打つ
    fill_convex(x - w / 3 + w / 3 * 2 * i, y, 4, r, g, b, a)
  end
end

# nはゴーストの数
def ghosts(n = 1)
  w = 60 # 胴体部分に当たる長方形の横の長さ
  h = 30 # 胴体部分に当たる長方形の縦の長さ
  s = 4 # ゴーストの両足に当たる凸を構成する正方形4つのうちの1辺の長さ

  # 赤、ピンク、水色、オレンジ
  red = [255, 0, 0] # 赤
  pink = [255, 182, 193] # ピンク
  light_blue = [0, 255, 255]
  orange = [255, 165, 0]

  n.times do
    x = rand((w / 2)..(300 - w / 2)) # 胴体部分に当たる長方形のx軸
    y = rand((10 + h / 2)..(200 - h / 2)) # 胴体部分に当たる長方形のy軸
    color = [red, pink, light_blue, orange].sample

    # まずゴーストの胴体である長方形を配置する
    fillrect(x, y, w, h, color[0], color[1], color[2], 0.0)
    # ゴーストの頭となるような楕円を配置する
    fillellipse(x, y - h / 2, w / 2, 10, color[0], color[1], color[2], 0.0)
    # 足を切り抜く
    two_convex(x, y + h / 2 - s / 2, w, 255, 255, 255, 0.0)
    fillrect(x, y + h / 2 - s, s * 2, s * 2, 255, 255, 255, 0.0)
    # ゴーストの目となるような楕円を配置する
    rx = 6
    ry = 8
    # 左目
    fillellipse(x - w / 4, y - h / 4, rx, ry, 255, 255, 255, 0.0)
    # 目玉
    fillcircle(x - w / 4 - rx / 2, y - h / 4 + ry / 3, 3, 0, 0, 0, 0.0)
    # 右目
    fillellipse(x + w / 4, y - h / 4, rx, ry, 255, 255, 255, 0.0)
    # 目玉
    fillcircle(x + w / 4 - rx / 2, y - h / 4 + ry / 3, 3, 0, 0, 0, 0.0)
    writeimage(__FILE__.match(%{(^.*).rb})[1] + ".ppm")
  end
end

# 使い方
# load 'packman.rb'
# ghosts 5
