### Definitions
# “Clients shouldn’t depend on methods they don’t use. 
# Several client-specific interfaces are better than one generalized interface.”
# "It’s better to have multiple simple methods instead of one bigger"

# if you have classes that inherit from the base class (adapters, for example),
# they should have the same method names, number of accepted arguments,
# and type of returned values. It’s then possible to replace (substitute)
# the base class with any of its children as they provide the same class structure.

# Example 1

# Violation of the Interface Segregation Principle in Ruby
class CoffeeMachineInterface
  def select_drink_type
      # select drink type logic
  end

  def select_portion
     # select portion logic
  end

  def select_sugar_amount
     # select sugar logic
  end

  def brew_coffee
     # brew coffee logic
  end

  def clean_coffee_machine
    # clean coffee machine logic
  end

  def fill_coffee_beans
    # fill coffee beans logic
  end

  def fill_water_supply
    # fill water logic
  end

  def fill_sugar_supply
    # fill sugar logic
  end
end

class Person
  def initialize
    @coffee_machine = CoffeeMachineInterface.new
  end

  def make_coffee
    @coffee_machine.select_drink_type
    @coffee_machine.select_portion
    @coffee_machine.select_sugar_amount
    @coffee_machine.brew_coffee
  end
end

class Staff
  def initialize
    @coffee_machine = CoffeeMachineInterface.new
  end

  def serv
    @coffee_machine.clean_coffee_machine
    @coffee_machine.fill_coffee_beans
    @coffee_machine.fill_water_supply
    @coffee_machine.fill_sugar_supply
  end
end

# Correct use of the Interface Segregation Principle in Ruby
class CoffeeMachineUserInterface
  def select_drink_type
      # select drink type logic
  end

  def select_portion
     # select portion logic
  end

  def select_sugar_amount
     # select sugar logic
  end

  def brew_coffee
     # brew coffee logic
  end
end

class CoffeeMachineServiceInterface
  def clean_coffee_machine
    # clean coffee machine logic
  end

  def fill_coffee_beans
    # fill coffee beans logic
  end

  def fill_water_supply
    # fill water logic
  end

  def fill_sugar_supply
    # fill sugar logic
  end
end

class Person
  def initialize
    @coffee_machine = CoffeeMachineUserInterface.new
  end

  def make_coffee
    @coffee_machine.select_drink_type
    @coffee_machine.select_portion
    @coffee_machine.select_sugar_amount
    @coffee_machine.brew_coffee
  end
end

class Staff
  def initialize
    @coffee_machine = CoffeeMachineServiceInterface.new
  end

  def serv
    @coffee_machine.clean_coffee_machine
    @coffee_machine.fill_coffee_beans
    @coffee_machine.fill_water_supply
    @coffee_machine.fill_sugar_supply
  end
end

# Example 2

