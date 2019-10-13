def cone_volume(radius:, height:)
  # 円錐の体積の公式 V = 1/3πr^2h
  Math::PI * radius ** 2 * height / 3
end

puts cone_volume(radius: 2, height: 3)