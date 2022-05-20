# A small simple object, like money or a date range, whose equality isn't based on identity.
# Object that will be responsible for providing methods that return only values

# Example 1
class Email
  def initialize(value)
    @value = value
  end

  def domain
    @value.split('@').last
  end
end
puts Email.new('sz.soczewka@gmail.com').domain
# => "gmail.com"

# Example 2
class Color
  CSS_REPRESENTATION = {
    'black' => '#000000',
    'white' => '#ffffff'
  }.freeze

  def initialize(name)
    @name = name
  end

  def css_code
    CSS_REPRESENTATION[@name]
  end

  def ==(other)
    name == other.name
  end

  attr_reader :name
end
Color.new('black') == Color.new('black') # => true
Color.new('black') == Color.new('white') # => false

# Use meaningful name - this one is obvious and applies to any other class or any other design pattern
#  but in case of value objects bad naming can destroy the implementation and makes it harder to extend.
#  Person class indicates a real person more than User name which is better for an entry in the system.
#  Just like the real world, you may call somebody a programmer but if you would use a more specific name
#  like a backend or frontend developer, it becomes obvious what attributes his object representation may provide.
# Use proper equality comparison - don't compare by identity but using attributes of a given object.
#  Two instances of Fruit object have different object_id but they should be considered as equal if both instances
#  have the same name, for example, Banana
# Use comparable module - if you plan to perform operations like sorting or making a unique list out of your objects,
  #  use comparable module along with the other methods that will extend your objects and make them behave like a collections
# Use duck typing - take care of your objects' conversion to make the code more readable and testable
# Make your objects immutable - once you pass values to your object, don't change them. If you need them changed,
#  create another instance. The idea of value objects is to provide value not maintain any states or change the data.