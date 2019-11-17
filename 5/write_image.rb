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


def mypicture
  pset(100, 80, 255, 0, 0)
  writeimage(__FILE__.match(%{(^.*).rb})[1] + "_t.ppm")
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

def mypicture2
  filecircle(110, 100, 60, 255, 0, 0)
  filecircle(180, 120, 40, 100, 200, 80)
  writeimage(__FILE__.match(%{(^.*).rb})[1] + "_circle.ppm")
end

def mypicture3
  fillcircle(100, 120, 80) do |x, y|
    theta = Math.atan2(y - 100, x - 120) * 180 / Math::PI
    if theta > 15 || theta < -15 then
      pset(x, y, 255, 0, 0)
    end
  end
  writeimage(__FILE__.match(%{(^.*).rb})[1] + "_circle2.ppm")
end

def mypicture4a
  fillcircle2(100, 120, 80)
  writeimage(__FILE__.match(%{(^.*).rb})[1] + "_circle3.ppm")
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

