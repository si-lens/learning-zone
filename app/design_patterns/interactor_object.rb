# Interaction is a set of actions performed one by one.
# When one of the actions is stopped, then other actions should not be performed.
class VerifyAccountBalance
  include Interactor

  def call
    return if context.user.enabled? && context.account.balance >= context.amount

    context.fail!(message: 'not enough money')
  end
end

class VerifyRecipient
  include Interactor

  def call
    return if context.recipient.enabled? && some_other_procedure

    context.fail!(message: 'recipient is invalid')
  end
end

class SendMoney
  include Interactor

  def call
    # perform the bank transfer
  end
end

class MakeTheBankTransfer
  include Interactor::Organizer

  organize VerifyAccountBalance, VerifyRecipient, SendMoney
end

outcome = MakeTheBankTransfer.call(
  user: user, amount: 100.0, recipient: other_user, account: account
)
outcome.success? # => false
outcome.message # => "recipient is invalid"