class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status 

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount 
    @status = 'pending'
  end 

  def valid?
    self.sender.valid?(self.amount)  && self.receiver.valid?  
  end 

	def execute_transaction
		if @sender.balance > amount && @status == "pending" && valid? == true
 			@sender.deposit(-@amount)
 			@receiver.deposit(@amount)
 			@status = "complete"
 		else
 			bad_transaction
 		end
 	end
  	def bad_transaction
		@status = "rejected"
		"Transaction rejected. Please check your account balance."
 	end
  	def reverse_transfer
 		if @status == "complete"
 			@sender.deposit(@amount)
 			@receiver.deposit(-@amount)
 			@status = "reversed"
 		end
 	end
end
