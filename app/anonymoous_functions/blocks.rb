### DEFINITION ###
# Piece of code that can be passed as an argument
### DEFINITION ###

### USAGE ###
# 1. Executing a block with a yield keyword (unnamed block)
def measure_time
  start_time = Time.now.to_i
  yield
  end_time = Time.now.to_i - start_time
  puts "#{end_time} seconds"
end

measure_time { sleep(2) }
# => 2 seconds


def yield_example
  puts 'before'
  yield # puts rand(100)
  puts 'middle'
  yield # puts rand(100)
  puts 'after'
end

yield_example { puts rand(100) }

# Method does not have yield keyword
def measure_time; end
measure_time { puts 'hello' }
# => nil

# Executing a named block. The block with & sign becomes a proc
def measure_time(&block_to_execute)
  start_time = Time.now.to_i
  block_to_execute.call
  end_time = Time.now.to_i - start_time
  puts "#{end_time} seconds"
end
measure_time { sleep(2) }
# => 2 seconds
### USAGE ###

### EXTRAS ###
# Making sure block is passed
def yield_example
  block_given? ? yield : puts('No block given')
end

yield_example { puts 'Hello, i am the block' }
# => Hello, i am the block
yield_example
# => No block given
### EXTRAS ###
