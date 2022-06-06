require "./modules/balanceable"

class Bank
  include Balanceable

  def initialize
    @balance = 0
  end
end
