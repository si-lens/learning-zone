# When you call super, you pass all the arguments to the parent implicitly.
class Parent
  def call(name, email)
    puts "name: #{name}, email: #{email}"
  end
end

class Child < Parent
  def call(name, email)
    super
    puts "child call"
  end
end
Child.new.call('John', 'john@gmail.com')
# => "name: John, email: john@gmail.com"
# => "child call"

class Child < Parent
  def call(name, email)
    super()
    puts "child call"
  end
end
Child.new.call('John', 'john@gmail.com')
# => ArgumentError: wrong number of arguments (given 0, expected 2)
class Child < Parent
  def call(name, email)
    super(name, email)
    puts "child call"
  end
end
Child.new.call('John', 'john@gmail.com')
# => "name: John, email: john@gmail.com"
# => "child call"

