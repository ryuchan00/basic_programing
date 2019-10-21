def gcd (x,y)
  p x 
  p y 
# gcd1:整数x、yの最大公約数を返す
# x≠yである間繰り返し、
  while x != y
  # x＞yなら、
    if x > y
    # x←x - y。
      x = x - y
      # そうでなければ、
    else
    # y←y - x。
      y = y- x
      # 枝分かれ終わり。
    end
    # 繰り返し終わり。
  end 
# xを返す。
  return x
end
