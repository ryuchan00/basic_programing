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

def filldonut(x, y, r1, r2, r = 0, g = 0, b = 0, a = 0.0)
  j0 = (y - r1).to_i; j1 = (y + r1).to_i
  i0 = (x - r1).to_i; i1 = (x + r1).to_i
  j0.step(j1) do |j|
    i0.step(i1) do |i|
      d2 = (i - x) ** 2 + (j - y) ** 2
      if r2 ** 2 <= d2 && d2 <= r1 ** 2
        if block_given? then
          yield(i, j)
        else
          pset(i, j, r, g, b, a)
        end
      end
    end
  end
end

def fillrotellipse(x, y, rx, ry, theta, r = 0, g = 0, b = 0, a = 0.0)
  d = (
  if rx > ry then
    rx
  else
    ry
  end)
  j0 = (y - d).to_i; j1 = (y + d).to_i
  i0 = (x - d).to_i; i1 = (x + d).to_i
  j0.step(j1) do |j|
    i0.step(i1) do |i|
      dx = i - x; dy = j - y;
      px = dx * Math.cos(theta) - dy * Math.sin(theta)
      py = dx * Math.sin(theta) + dy * Math.cos(theta)
      if (px / rx) ** 2 + (py / ry) ** 2 < 1.0
        if block_given? then
          yield(i, j)
        else
          pset(i, j, r, g, b, a)
        end
      end
    end
  end
end

def filltriangle(x0, y0, x1, y1, x2, y2, r, g, b, a = 0.0)
  fillconvex([x0, x1, x2, x0], [y0, y1, y2, y0], r, g, b, a)
  fillconvex([x0, x2, x1, x0], [y0, y2, y1, y0], r, g, b, a)
end

def fillconvex(ax, ay, r = 0, g = 0, b = 0, a = 0.0)
  xmax = ax.max.to_i; xmin = ax.min.to_i
  ymax = ay.max.to_i; ymin = ay.min.to_i
  ymin.step(ymax) do |j|
    xmin.step(xmax) do |i|
      if isinside(i, j, ax, ay)
        if block_given? then
          yield(i, j)
        else
          pset(i, j, r, g, b, a)
        end
      end
    end
  end
end

def isinside(x, y, ax, ay)
  (ax.length - 1).times do |i|
    if oprod(ax[i + 1] - ax[i], ay[i + 1] - ay[i], x - ax[i], y - ay[i]) < 0
      return false
    end
  end
  return true
end

def oprod(a, b, c, d)
  return a * d - b * c;
end

def fillline(x0, y0, x1, y1, w, r = 0, g = 0, b = 0, a = 0.0)
  dx = y1 - y0; dy = x0 - x1; n = 0.5 * w / Math.sqrt(dx ** 2 + dy ** 2)
  dx = dx * n; dy = dy * n
  fillconvex([x0 - dx, x0 + dx, x1 + dx, x1 - dx, x0 - dx],
    [y0 - dy, y0 + dy, y1 + dy, y1 - dy, y0 - dy], r, g, b, a)
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

def mypicture4
  # fillcircle(150, 30, 60, 255, 100, 70, 0.0)
  # fillrect(60, 100, 120, 80, 80, 220, 255, 0.6)
  # fillrotellipse(200, 60, 70, 40, 1.0, 100, 100, 220, 0.7)
  # filltriangle(200, 100, 300, 100, 250, 200, 200, 100, 250, 0.5)
  # fillline(40, 40, 260, 160, 4, 0, 0, 0, 0.0)
  # filldonut(190, 100, 120, 90, 150, 100, 80, 0.5)
  writeimage(__FILE__.match(%{(^.*).rb})[1] + ".ppm")
end

# --- ここからパックマンの敵、ゴーストを作るためのメソッド集
#
#

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

def two_convex(y, w, r = 0, g = 0, b = 0, a = 0.0)
  # 足の太さは4px
  2.times do |i|
    # 0,1
    fill_convex(w / 3 / 2 + w / 3 * 2 * i, y, 4, r, g, b, a)
  end
end

# nはゴーストの数
def ghosts(n = 1)
  w = 60 # 胴体部分に当たる長方形の横の長さ
  h = 30 # 胴体部分に当たる長方形の縦の長さ
  x = 30 # 胴体部分に当たる長方形のx軸
  y = 40 # 胴体部分に当たる長方形のy軸
  s = 4 # ゴーストの両足に当たる凸を構成する正方形4つのうちの1辺の長さ
  # まずゴーストの胴体である長方形を配置する
  fillrect(x, y, w, h, 0, 255, 255, 0.0)
  # ゴーストの頭となるような楕円を配置する
  fillellipse(x, 25, w / 2, 10, 0, 255, 255, 0.0)
  # 足を切り抜く
  two_convex(y + h / 2 - s / 2, w, 255, 255, 255, 0.0)
  fillrect(x, y + h / 2 - s, s * 2, s * 2, 255, 255, 255, 0.0)
  # ゴーストの目となるような楕円を配置する
  rx = 6
  ry = 8
  # 左目
  fillellipse(x - w / 4, y - h / 4, rx, ry, 255, 255, 255, 0.0)
  # 目玉
  fillellipse(x - w / 4 - rx / 2, y - h / 4 + ry / 3, 3, 3, 0, 0, 0, 0.0)
  # 右目
  fillellipse(x + w / 4, y - h / 4, rx, ry, 255, 255, 255, 0.0)
  # 目玉
  fillellipse(x + w / 4 - rx / 2, y - h / 4 + ry / 3, 3, 3, 0, 0, 0, 0.0)
  writeimage(__FILE__.match(%{(^.*).rb})[1] + ".ppm")
end

ghosts
