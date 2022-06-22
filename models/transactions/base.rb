module Transaction
  class Base
    attr_reader :amount, :account

    def initialize(account, amount)
      @account = account
      @amount = amount
    end
  end
end
