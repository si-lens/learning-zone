# The policy object pattern is useful when you have to check multiple conditions before performing a given action
class BankTransferPolicy
  def self.allowed?(user, recipient, amount)
    user.account_balance >= amount &&
      user.transfers_enabled &&
      user != recipient &&
      amount.positive?
  end
end