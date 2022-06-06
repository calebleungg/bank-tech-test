require "rspec"
require "./models/user"
require "./models/bank"
require "./models/transactions/base"

# rspec spec/models/transactions/base_spec.rb
RSpec.describe Transaction::Base do
  describe "transaction" do
    before(:each) do
      @bank = Bank.new
      @user = User.new(@bank)
      @transaction = Transaction::Base.new(@user, 1000)
    end

    it "has correct attributes" do
      expect(@transaction.user).to eq(@user)
      expect(@transaction.bank).to eq(@bank)
      expect(@transaction.amount).to eq(1000)
    end
  end
end
# rspec spec/models/transactions/base_spec.rb
