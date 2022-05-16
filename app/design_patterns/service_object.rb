# The service object is a very simple concept of a class that is responsible for doing only one thing
# It usually contains code that doesn't fit in the model or view layer, e.g., 
# actions via a third-party API like posting a tweet.
class PaymentService
  def self.call(amount)
    puts "Payment of #{amount} was made"
  end
end
PaymentService.call(100)