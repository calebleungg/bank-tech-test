require "rspec"
require "./models/user"
require "./models/bank"

# rspec spec/examples/alice_spec.rb
RSpec.describe "AliceExample" do
  describe "alice transactions" do
    it "should reflect correctly across all balances" do
      bank = Bank.new
      alice = User.new(bank)

      # 1. Alice deposits $30 and withdraws $20
      alice.deposit(3000)
      alice.withdraw(2000)

      expect(alice.balance).to eq(1000)
      expect(bank.balance).to eq(1000)

      # 2. Alice cannot withdraw $11
      expect { alice.withdraw(1100) }.to_not change { alice.balance }
      expect(alice.balance).to eq(1000)
      expect(bank.balance).to eq(1000)
    end
  end
end
# rspec spec/examples/alice_spec.rb
