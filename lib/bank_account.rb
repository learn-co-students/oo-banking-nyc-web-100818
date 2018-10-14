class BankAccount

  attr_accessor :balance,:status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  # #deposit takes in amount as argument and adds that to the existing value of @balance (self.balance)
  def deposit (amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  # #valid? checks for self.status == "open" AND self.balance >0, if both are true (using if and &&) then return true otherwise false
  def valid?
    if self.status =="open" && self.balance > 0
      true
    else
      false
    end

  end

  # #close_account - closes the account, change status to "closed"

  def close_account
    self.status = "closed"

  end

end #end of BankAccount Class
