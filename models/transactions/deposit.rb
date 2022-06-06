require "./models/transactions/base"

class Deposit < Transaction::Base
  def initialize(user, amount)
    super(user, amount)
  end

  def perform
    @user.add_balance(@amount)
    @bank.add_balance(@amount)
  end
end
