### DEFINITION ###
# A Proc object is an encapsulation of a block of code,
# which can be stored in a local variable,
# passed to a method or another Proc, and can be called.
### DEFINITION ###

### USAGE ###
my_proc = Proc.new { puts "call my block" }
my_proc.call
# Proc can accept arguments that are passed then to the call method 
# but don't expect any error if you would pass too many arguments or none of them:
proc = Proc.new { |x, y| puts "x: #{x}, y: #{y}" }
proc.call
# => nil
### USAGE ###

### RETURNING A PROC ###
def some_method
  proc = Proc.new { return :first_name }
  proc.call
  return :last_name
end
some_method
# => :first_name
proc = Proc.new { return :first_name }
# proc.call
# => LocalJumpError: unexpected return
### RETURNING A PROC ###


### PROC AS PARAMETER ###
def proc_executor(proc)
  proc.call(3,6)
end
my_proc = Proc.new { |x,y| puts [x**2, y**2] }
proc_executor(my_proc)
# => [9, 36]
### PROC AS PARAMETER ###
