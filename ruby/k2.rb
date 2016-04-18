def test1(a)
  puts "> #{a[0]}"
  a[0].next!
  puts "> #{a}"
end
b = "x"
puts b
test1(b)
puts b
