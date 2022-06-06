require "./models/transactions/deposit"
require "./models/transactions/withdrawal"
require "./modules/balanceable"

class User
  attr_reader :bank
  include Balanceable

  def initialize(bank)
    @balance = 0
    @bank = bank
  end

  def deposit(amount)
    Deposit.new(self, amount).perform
  end

  def withdraw(amount)
    Withdrawal.new(self, amount).perform
  end
end
