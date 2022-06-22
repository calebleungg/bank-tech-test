require "./models/transactions/deposit"
require "./models/transactions/withdrawal"
require "./modules/balanceable"

class Account
  include Balanceable
  attr_reader :id

  def initialize(id:)
    @id = id
    @balance = 0
  end
end
