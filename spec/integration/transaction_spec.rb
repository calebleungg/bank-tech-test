require "rspec"
require "./models/user"
require "./models/bank"

# rspec spec/integration/transaction_spec.rb
RSpec.describe Bank do
  before(:each) do
    @bank = Bank.new
    @user = @bank.register_new_user
    
    # this integration test is for multi account scenarios
    @savings_account = @bank.register_account_for_user(user: @user)
    @everyday_account = @bank.register_account_for_user(user: @user)

    expect(@user.accounts.count).to eq(2)
  end

  describe "deposits" do
    it "a user can deposit into a specific account" do
      @bank.deposit(
        user_id: @user.id,
        account_id: @savings_account.id,
        amount: 1000
      )

      expect(@savings_account.balance).to eq(1000)
    end

    it "a user cannot despoit a negative balance" do
      @bank.deposit(
        user_id: @user.id,
        account_id: @savings_account.id,
        amount: -1000
      )

      expect(@savings_account.balance).to eq(0)
    end

    it "mutli account deposits work" do
      @bank.deposit(
        user_id: @user.id,
        account_id: @savings_account.id,
        amount: 1000
      )
      
      @bank.deposit(
        user_id: @user.id,
        account_id: @everyday_account.id,
        amount: 2000
      )

      expect(@savings_account.balance).to eq(1000)
      expect(@everyday_account.balance).to eq(2000)
      expect(@bank.total_balance).to eq(3000)
    end

    it "total balance of bank" do

    end
  end

  describe "withdrawals" do
    it "a user can withdraw from speciifc account" do
    end

    it "a user cannot withdraw if insufficient funds" do
    end
  end

  describe "balances" do
    it "over multiple accounts reflect correct amount" do
    end

    it "bank total balance reflects correctly" do
    end
  end
end
# rspec spec/integration/transaction_spec.rb
