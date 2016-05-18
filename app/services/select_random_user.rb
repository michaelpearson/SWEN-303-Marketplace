class SelectRandomUser
  attr_reader :stock
  def initialize(stock)
    @stock = stock
  end

  def call
    bidding_users.sample
  end

  private

  def bidding_users
    stock.transactions.map(&:user)
  end
end