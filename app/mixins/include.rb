# INCLUDE - included module is second in the list of ancestors
# super called from class will trigger method in the module
module SomeModule
  def call
    puts "Hi from SomeModule"
  end
end

class SomeClass
  include SomeModule
  def call
    puts "Hi from SomeClass"
    super
  end
end

puts SomeClass.ancestors
# => [SomeClass, SomeModule, Object, Kernel, BasicObject]
puts SomeClass.new.call
# => Hi from SomeClass
# => Hi from SomeModule