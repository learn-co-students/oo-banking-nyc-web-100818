class Transfer
 
 	attr_reader :sender, :receiver
 	attr_accessor :amount, :status

 	def initialize(sender,receiver, amount = 0)
 		@sender = sender
 		@receiver = receiver
 		@status = "pending"
 		@amount = amount
	end

	def valid?
 		if @sender.valid? && @receiver.valid?
 			true
 		else
 			false
 		end
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










