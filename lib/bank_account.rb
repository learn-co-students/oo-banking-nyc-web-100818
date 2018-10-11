class BankAccount
  
  attr_reader :name
  attr_accessor :balanace, :status
  
  def initialize(name)
    # @bank_account = bank_account
    @name = name
    @balance = 1000
    @status = 'open'
  end 
  
  def balance 
  end
  
  def deposit(amount)
    @balance += amount
  end 
  
  def display_balance
    "#{self.balance}"
  end 

end
