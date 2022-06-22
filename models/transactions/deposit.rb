require "./models/transactions/base"

class Deposit < Transaction::Base
  def initialize(account, amount)
    super(account, amount)
  end

  def perform
    @account.add_balance(@amount)
  end
end
