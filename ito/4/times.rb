def array01times
  a = Array.new(10, 0)
  5.times do |i| a[2*i+1] = 1 end  # i: 0,1,2,3,4 2*i+1: 1,3,5,7,9
  return a
end
