require "pry"

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    valid = false
    if @sender.valid? && @receiver.valid?
      valid = true
    end
    valid
  end

  def execute_transaction
    if self.valid? && @sender.balance >= @amount && @status != "complete"
      @status = "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @status = "reversed"
      @receiver.balance -= @amount
      @sender.balance += @amount
    end
  end



end

#valid?
    # can check that both accounts are valid (FAILED - 1)
    # calls on the sender and receiver's #valid? methods (FAILED - 2)
