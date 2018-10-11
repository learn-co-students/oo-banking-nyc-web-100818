class Transfer

  attr_accessor :sender, :receiver, :amount, :status
  # your code here
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? == true && receiver.valid? == true
    sender.balance >= @amount
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."

end
  end

def reverse_transfer
  if @status == "complete"
  self.sender.balance += amount
  self.receiver.balance -= amount
  @status = "reversed"
end
end

end
