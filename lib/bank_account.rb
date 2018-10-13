require 'pry'
class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(amount)
    @balance += amount
  end

  def balance
    @balance
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    valid = false
    if @status ==  "open" && @balance > 0
      valid = true
    end
    valid
  end

  def close_account
    @status = "closed"
  end 

end


b1 = BankAccount.new("yoan")
binding.pry
