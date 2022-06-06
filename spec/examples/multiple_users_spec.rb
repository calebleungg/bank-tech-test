require "rspec"
require "./models/user"
require "./models/bank"

# rspec spec/examples/multiple_users_spec.rb
RSpec.describe "AliceExample" do
  describe "mutliple users" do
    it "Deposit, withdraw and maintain a balance for multiple customers" do
      bank = Bank.new
      user1 = User.new(bank)
      user2 = User.new(bank)
      user3 = User.new(bank)

      user1.deposit(1000)
      user2.deposit(2000)
      user3.deposit(3000)

      user1.withdraw(500)
      user2.withdraw(200)
      user3.withdraw(800)

      # separate user balances should be maintained
      expect(user1.balance).to eq(500)
      expect(user2.balance).to eq(1800)
      expect(user3.balance).to eq(2200)

      # accumulative balance for bank should be correct
      expect(bank.balance).to eq(4500)
    end
  end
end
# rspec spec/examples/multiple_users_spec.rb
