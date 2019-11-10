$val = []
$log = []

def e(x)
  log(x)
  $val.push(x)
  return $val
end

def add
  log('+')
  y = $val.pop
  x = $val.pop
  $val.push(x + y)
  return $val
end

def mul
  log('*')
  y = $val.pop
  x = $val.pop
  $val.push(x * y)
  return $val
end

def clear
  $before = $val.dup
  $val = []
  return $val
end

def sub
  log('-')
  y = $val.pop
  x = $val.pop
  $val.push(x - y)
  return $val
end

def div
  log('/')
  y = $val.pop
  x = $val.pop
  $val.push(x / y)
  return $val
end

def mod
  log('%')
  y = $va/l.pop
  x = $val.pop
  $val.push(x % y)
  return $val
end

def inv
  log('inv')
  y = $val.pop
  $val.push(-1 * y)
  return $val
end

def exch
  log('exch')
  y = $val.pop
  x = $val.pop
  $val.push(y)
  $val.push(x)
  return $val
end

def show
  puts $log.join(' ')
  clear
end

def log(operation)
  $log.push(operation)
  $before = $val.dup
end

def cancel
  $log.push('cancel')
  tmp_val = $val.dup
  $val = $before.dup
  $before = tmp_val
  return $val
end

# cancelをcancelする
def redo_cancel
  # 直前がcancel処理ではない
  return $val if $log.last != 'cancel'
  $log.push('redo')
  cancel
end