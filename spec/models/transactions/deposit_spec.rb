require "rspec"
require "./models/user"
require "./models/bank"

# rspec spec/models/transactions/deposit_spec.rb
RSpec.describe Transaction::Base do
  describe "class methods" do
    before(:each) do
      @bank = Bank.new
      @user = User.new(@bank)
    end

    it "#perform correctly deposits amount into bank + user" do
      Deposit.new(@user, 1000).perform

      expect(@bank.balance).to eq(1000)
    end
  end
end
# rspec spec/models/transactions/deposit_spec.rb
