module Balanceable
  attr_reader :balance

  def add_balance(amount)
    return "Not allowed" unless is_positive_amount?(amount)

    @balance += amount
  end

  def subtract_balance(amount)
    return "Not allowed" unless is_positive_amount?(amount)

    @balance -= amount
  end

  private

  def is_positive_amount?(amount)
    amount > 0
  end
end
