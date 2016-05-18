class BidOnItem
  attr_reader :stock, :user
  def initialize(stock, user)
    @stock = stock
    @user = user
  end

  def call
    transaction = Transaction.create(
      user: user,
      stock: stock,
      kind: "BID"
    )

    user.token_count -= 1
    user.save

    if stock.met_required_bids?
      NotifyUsersOfStockCompletion.new(stock, SelectRandomUser.new(stock).call).call
    end
  end
end