def array01
# Array.new はメソッドを呼び出している。     
   a = Array.new(10, 0)
    1.step(9, 2) do |i| a[i] = 1 end
   return a
end
