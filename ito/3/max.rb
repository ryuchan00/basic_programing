def arraymax(a)
  max = a[0]
  a.each do |i|
    if i > max then max = i end
  end
  return max
 
  
end
