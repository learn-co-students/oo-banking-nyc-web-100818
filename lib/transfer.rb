class Transfer

  attr_accessor :sender, :receiver, :amount, :status, :amount_transfer

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @amount_transfer = 0
  end

  def valid?
    sender.valid? == true && receiver.valid? == true
  end

  def execute_transaction
    if self.valid? && sender.balance > @amount
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
      @amount_transfer = @amount
      @amount = 0
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    sender.balance += @amount_transfer
    receiver.balance -= @amount_transfer
    @status = "reversed"
  end

end
