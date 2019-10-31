$x = 0
$x_before = 0
def sum(v)
  $x = $x + v
  return $x
end

def dec(v)
  $x = $x - v
  return $x
end

def reset
  $x_before = $x
  $x = 0
end

def undo
  $x = $x_before 
end
