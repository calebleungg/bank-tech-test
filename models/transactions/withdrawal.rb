require "./models/transactions/base"

class Withdrawal < Transaction::Base
  def initialize(account, amount)
    super(account, amount)
  end

  def perform
    return unless user_has_funds?

    @account.subtract_balance(@amount)
  end

  private
  
  def user_has_funds?
    @user.balance >= @amount
  end
end
