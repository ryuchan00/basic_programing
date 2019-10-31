$x = 0
$master = false
def sum(v)
  $x = $x + v
  return $x
end
def sum_not_global(v)
  y = 0
  y = y + v
  return y
end
def reset
  $x = 0
end
def master?
  if $master
    return 'masterへ挑戦できる'
  else
    return 'masterへ挑戦できない'
  end
end

def clear
  $master = true
end
