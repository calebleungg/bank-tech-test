require "./models/transactions/base"

class Withdrawal < Transaction::Base
  def initialize(user, amount)
    super(user, amount)
  end

  def perform
    return unless user_has_funds?

    @user.subtract_balance(@amount)
    @bank.subtract_balance(@amount)
  end

  private
  
  def user_has_funds?
    @user.balance >= @amount
  end
end
