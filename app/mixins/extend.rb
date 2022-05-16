# EXTEND
# Methods from the module that is extended, are available as class methods.
module SomeModule
  def call
    puts "Hi from SomeModule"
  end
end

class SomeClass
  extend SomeModule
end

SomeClass.call
# => Hi from SomeModule