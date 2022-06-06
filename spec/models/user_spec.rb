require "rspec"
require "./models/user"
require "./models/bank"

# rspec spec/models/user_spec.rb
RSpec.describe User do
  before(:each) do
    @bank = Bank.new
    @user = User.new(@bank)
  end

  describe "user" do
    it "has correct attributes" do
      expect(@user.bank).to be_a(Bank)
      expect(@user.balance).to eq(0)
    end
  end

  describe "methods" do
    it "#deposit correctly adds to bank balance" do
      @user.deposit(1000)
      expect(@user.balance).to eq(1000)
      expect(@bank.balance).to eq(1000)
    end

    it "#withdraw correctly adds to bank balance" do
      @user.deposit(1000)
      @user.withdraw(500)

      expect(@user.balance).to eq(500)
      expect(@bank.balance).to eq(500)
    end
  end
end
# rspec spec/models/user_spec.rb
