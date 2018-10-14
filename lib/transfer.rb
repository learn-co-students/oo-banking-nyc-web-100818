class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

   def initialize(sender, receiver, amount)
     @sender = sender
     @receiver = receiver
     @amount = amount
     @status = "pending"
   end

   def valid? # this calls on the valid? method inside the BankAccount class
     @sender.valid? && @receiver.valid?
   end

   def execute_transaction
     if self.status == "pending" # can only happen if the status is pending
       @sender.balance -= @amount
       @receiver.balance += @amount
       self.status = "complete" # once the status is complete, the transaction cannot happen again
     end
     if !@sender.valid? # if sender status is NOT valid
        self.status = "rejected" # change status to rejected
        "Transaction rejected. Please check your account balance." # return this message
     end
   end

   def reverse_transfer
     if self.status == "complete"
       @sender.balance += @amount # put amount back in sender's account
       @receiver.balance -= @amount # take amount out of receiver's account
       self.status = "reversed"
     end
   end

end # end of Transfer class
