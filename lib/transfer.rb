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
    if self.valid? && sender.balance > @amount #self= the data of the TRANSFER. (transaction ifself) self.valid? -> valid? is checking the method above. checking is the sender's balance(bank_account) is > amount in this transfer
      sender.balance -= @amount  #taking the sender's balance by calling the attr_accessor :balance in the bank_account.rb
      receiver.balance += @amount
      @status = "complete"
      @amount_transfer = @amount  #saving the inital amount beacuse if we want to reverse (reverse_transfer) computer needs to remember what the amount was
      @amount = 0 #execute_transaction wants the balance of the trasnfer to not transfer more than once so that you cannot call it again.
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
