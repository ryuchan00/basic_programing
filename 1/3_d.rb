# xをy乗する
def multiplier(x, y)
  return 1 if y.zero?
  r = 1
  y.times do
    r *= x
  end
  r
end

puts multiplier(2, 0)
puts multiplier(2, 6)
puts multiplier(2, 7)
puts multiplier(2, 8)