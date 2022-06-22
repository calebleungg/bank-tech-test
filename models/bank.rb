require "./models/transactions/withdrawal"
require "./models/transactions/deposit"
require "./modules/balanceable"

class Bank
  include Balanceable
  attr_reader :users

  def initialize
    @users = []
  end

  def register_new_user
    new_user = User.new(id: @users.count)
    @users << new_user

    new_user
  end

  def register_account_for_user(user:)
    user.create_new_account
  end

  def deposit(user_id:, account_id:, amount:)
    user = find_user_by_id(user_id:)
    account = user.find_account_by_id(account_id:)
    Deposit.new(account, amount).perform
  end

  def withdraw(user:, account:, amount:)
    user = find_user_by_id(user_id:)
    account = user.find_account_by_id(account_id:)
    Withdrawal.new(account, amount).perform
  end

  def total_balance
    @users.flat_map { |user| user.accounts }.sum { |account| account.balance }
  end

  # def accounts
  #   @users.flat_map(&:accounts)
  # end

  private

  def find_user_by_id(user_id:)
    @users.find { |user| user.id == user_id} 
  end
end
