def countnegative(a)
  count = 0
  # a[i]が負ならカウントを1増やす
    a.each_index do |i|
    if 0 > a[i]  
    
    count = count + 1
       
      end
    end
  return count
end
