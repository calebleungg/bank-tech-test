require "rspec"
require "./models/user"
require "./models/bank"

# rspec spec/models/transactions/withdrawal_spec.rb
RSpec.describe Transaction::Base do
  describe "class methods" do
    before(:each) do
      @bank = Bank.new
      @user = User.new(@bank)
    end

    it "#perform correctly subtracts amounts from user + bank balance" do
      # starting balances
      @bank.add_balance(2000)
      @user.add_balance(2000)

      Withdrawal.new(@user, 1000).perform
      expect(@bank.balance).to eq(1000)
      expect(@user.balance).to eq(1000)
    end

    it "#perform doesn't perform if user has insufficient funds" do
      # starting balances
      @bank.add_balance(2000)
      @user.add_balance(100)

      expect { Withdrawal.new(@user, 1000).perform }.to_not change { @bank.balance }
      expect { Withdrawal.new(@user, 1000).perform }.to_not change { @user.balance }
    end
  end
end
# rspec spec/models/transactions/withdrawal_spec.rb
