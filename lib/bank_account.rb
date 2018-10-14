class BankAccount
  attr_reader :name
  attr_accessor :status, :balance

  def initialize(name) # initializes with a name of the account owner
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount) # customizing how set SET our balance
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}." # can also do @balance
  end

  def valid?
    @status == "open" && @balance > 0 ? true : false
  end

  def close_account
    self.status = "closed"
  end

end # end of BankAccount class
