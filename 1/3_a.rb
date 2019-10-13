def calculate(a, op, b)
  eval("#{a}#{op.to_s}#{b}")
end

# 演習3 a
puts '1+1'
puts calculate(1, :+, 1)
puts '1-1'
puts calculate(1, :-, 1)
puts '1*1'
puts calculate(1, :*, 1)
puts '1/1'
puts calculate(1, :/, 1)
# 演習3 b
puts '5%3'
puts calculate(5, :%, 3)