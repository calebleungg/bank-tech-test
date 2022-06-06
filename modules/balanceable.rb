module Balanceable
  attr_reader :balance

  def add_balance(amount)
    @balance += amount
  end

  def subtract_balance(amount)
    @balance -= amount
  end
end
