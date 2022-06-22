require "rspec"
require "./models/user"
require "./models/bank"

# rspec spec/integration/bank_spec.rb
RSpec.describe Bank do
  before(:each) do
    @bank = Bank.new
  end

  describe "bank" do
    it "a bank can register a user" do
      expect(@bank.users.count).to eq(0)

      new_user = @bank.register_new_user

      expect(@bank.users.count).to eq(1)
    end

    it "#register_new_user assigns incremental ids" do
      new_user = @bank.register_new_user

      expect(new_user.id).to eq(1)
    end

    it "#register_account_for_user works" do
      new_user = @bank.register_new_user

      expect(new_user.accounts.count).to eq(0)

      new_account = @bank.register_account_for_user(user: new_user)

      expect(new_account.id).to eq(0)
      expect(new_user.accounts.count).to eq(1)
    end

    it "users can register multiple accounts" do
      new_user = @bank.register_new_user

      3.times { @bank.register_account_for_user(user: new_user) }

      puts new_user.accounts
      expect(new_user.accounts.count).to eq(3)
    end
  end
end
# rspec spec/integration/bank_spec.rb
