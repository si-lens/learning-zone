### DEFINITION ###
# A class which allows both internal and external iteration.
### DEFINITION ###

enumerator = %w(one two three).each
puts enumerator.class # => Enumerator

enumerator.each_with_object("foo") do |item, obj|
  puts "#{obj}: #{item}"
end

# => foo: one
# => foo: two
# => foo: three

e = [1,2,3].each   # returns an enumerator object.
# puts e.next   # => 1
# puts e.next   # => 2
# puts e.next   # => 3

# Combining enumerators
enumerator_with_index = ['a','b','c'].each_with_index
puts enumerator_with_index.class.ancestors
enumerator_with_index.each  { |item, index, test| puts "#{item}:#{index}" }

# Enumerator for printing n fibonnaci numbers
fib = Enumerator.new do |n|
  a = b = 1
  loop do
    n << a
    a, b = b, a + b
  end
end
p fib.take(10) # => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]