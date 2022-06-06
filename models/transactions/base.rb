module Transaction
  class Base
    attr_reader :bank, :user, :amount

    def initialize(user, amount)
      @user = user
      @amount = amount
      @bank = user.bank
    end
  end
end
