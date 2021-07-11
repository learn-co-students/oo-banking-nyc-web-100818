class Transfer

  attr_accessor :sender,:receiver,:amount,:status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  # #valid? checks whether the sender account and receiver account are both valid, (calls on #valid? method from BankAccount Class

  def valid?
    self.receiver.valid? && self.sender.valid?
  end

  # #execute_transaction needs to do several things:
  #1. check if transaction happened already (can only happen once), check .status
  #2. reject transaction if the sender doesn't have a valid account
  #3. can execute the transaction (i.e. transfer the amounts)
  def execute_transaction
    if self.status == "pending" && self.sender.balance > self.amount && self.valid?
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  # #reverse_transfer does the following things:
  # checks if the status of a transfer = "completed"
  # if yes then reverse the transfer, (send back the transfer amount to sender and deduct from receiver)
  # change the status of a transfer = "reversed"
  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end # end of Transfer Class
