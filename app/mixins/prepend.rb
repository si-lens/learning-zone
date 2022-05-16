
# PREPEND - prepended module is put first in the list of ancestors
# super called from module will trigger method in the class where the module is prepended
module SomeModule
  def call
    puts "Hi from SomeModule"
    super
  end
end

class SomeClass
  prepend SomeModule
  def call
    puts "Hi from SomeClass"
  end
end

puts SomeClass.ancestors
# => [SomeModule, SomeClass, Object, Kernel, BasicObject]
puts SomeClass.new.call
# => Hi from SomeModule
# => Hi from SomeClass