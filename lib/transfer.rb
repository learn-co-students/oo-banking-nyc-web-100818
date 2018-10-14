class Transfer

attr_reader :sender, :receiver, :amount
  attr_accessor :status


def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
end

##valid? is valid with an open status and a balance greater than 0
def valid?  #expect(transfer.valid?).to eq(true)
  self.sender.valid? == self.receiver.valid?
end

def execute_transaction
  if valid? && sender.balance > amount && self.status == "pending"
    sender.balance -= @amount
    receiver.balance += @amount
    @status = "complete"
  else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
  end
end
# #execute_transaction needs to do several things:
  # can execute a successful transaction between two accounts
  # each transfer can only happen once
  # rejects a transfer if the sender doesn't have a valid account

def reverse_transfer
  if valid? && receiver.balance > amount && self.status == "complete"
    sender.balance += @amount
    receiver.balance -= @amount
    @status = "reversed"
  end
end

  #reverse_transfer
    # can reverse a transfer between two accounts
    # it can only reverse executed transfers
end #end of Transfer class











































# class Transfer
#   attr_accessor :sender, :receiver, :amount, :status, :amount_transfer
#
#   def initialize(sender, receiver, amount)
#     @sender = sender
#     @receiver = receiver
#     @amount = amount
#     @status = "pending"
#     @amount_transfer = 0
#   end
#   def valid?
#     sender.valid? == true && receiver.valid? == true
#   end
#   def execute_transaction
#     if self.valid? && sender.balance > @amount #self= the data of the TRANSFER. (transaction ifself) self.valid? -> valid? is checking the method above. checking is the sender's balance(bank_account) is > amount in this transfer
#       sender.balance -= @amount  #taking the sender's balance by calling the attr_accessor :balance in the bank_account.rb
#       receiver.balance += @amount
#       @status = "complete"
#       @amount_transfer = @amount  #saving the inital amount beacuse if we want to reverse (reverse_transfer) computer needs to remember what the amount was
#       @amount = 0 #execute_transaction wants the balance of the trasnfer to not transfer more than once so that you cannot call it again.
#     else
#       @status = "rejected"
#       "Transaction rejected. Please check your account balance."
#     end
#   end
#   def reverse_transfer
#     sender.balance += @amount_transfer
#     receiver.balance -= @amount_transfer
#     @status = "reversed"
#   end
# end
