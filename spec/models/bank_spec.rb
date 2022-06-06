require "rspec"
require "./models/bank"

# rspec spec/models/bank_spec.rb
RSpec.describe Bank do
  describe "attributes" do
    subject { Bank.new }
    it "has a balance" do
      expect(subject.balance).to eq(0)
    end
  end
end
# rspec spec/models/bank_spec.rb
