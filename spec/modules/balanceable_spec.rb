require "rspec"
require "./models/user"
require "./models/bank"

# rspec spec/modules/balanceable_spec.rb
RSpec.describe User do
  describe "module methods" do
    before(:each) do
      @bank = Bank.new
      @user = User.new(@bank)
    end

    it "#add_balance correctly adds amount to balanceable" do
      @user.add_balance(1000)
      expect(@user.balance).to eq(1000)
    end

    it "#subtract_balance correctly subtrats amount from balanceable" do
      @bank.add_balance(1000)
      @bank.subtract_balance(500)
      expect(@bank.balance).to eq(500)
    end
  end
end
# rspec spec/modules/balanceable_spec.rb
