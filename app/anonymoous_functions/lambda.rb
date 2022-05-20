### DEFINITION ###
# Lambda behaves like an older sister for the Proc.
# The truth is that Lambda is a Proc, but just a special version of it.
# It behaves similarly, but her behavior is more predictable.
# We can create a lambda using the lambda keyword or -> character:
### DEFINITION ###

### USAGE ###

# 1. with lambda keyword
my_lambda = lambda { puts "I'm lambda" }
my_lambda.call
# 2. with -> keyword
my_lambda = -> { puts "I'm lambda" }
my_lambda.call
### USAGE ###

### ARGUMENTS ###
my_lambda = lambda { |x, y| puts "x: #{x}, y: #{y}" }
my_lambda = ->(x, y) { puts "x: #{x}, y: #{y}" }
# my_lambda.call(1)
# => ArgumentError: wrong number of arguments (given 1, expected 2)
my_lambda.call(1,1)
# => x: 1, y: 1
### ARGUMENTS ###


### RETURNING LAMBDAS ###
# This return will work
my_lambda = lambda { return 1 }
my_lambda.call
# => 1

# This return won't, it will be ignored
def my_method
  my_lambda = lambda { return 1 }
  my_lambda.call
  2
end
my_method
# => 2
### RETURNING LAMBDAS ###

### LAMBDA AS PARAMETER ###
def lambda_executor(lambda)
  lambda.call
end
my_lambda = -> { puts 'hello from LAMBDA' }
lambda_executor(my_lambda)
# => hello from LAMBDA
my_lambda = lambda { puts 'hello from LAMBDA' }
lambda_executor(my_lambda)
# => hello from LAMBDA
### LAMBDA AS PARAMETER ###