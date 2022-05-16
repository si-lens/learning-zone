# class that will be responsible for providing methods that return only values
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