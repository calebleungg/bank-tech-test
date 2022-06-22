require "./models/account"

class User
  attr_reader :id, :accounts

  def initialize(id:)
    @id = id
    @accounts = []
  end

  # note: are ids okay here? (not globally unique)
  def create_new_account
    new_account = Account.new(id: @accounts.count)
    @accounts << new_account

    new_account
  end

  def find_account_by_id(account_id:)
    @accounts.find { |account| account.id == account_id }
  end
end
