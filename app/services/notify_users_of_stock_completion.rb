class NotifyUsersOfStockCompletion
  attr_reader :item, :winner

  def initialize(stock, winner)
    @item = stock
    @winner = winner
  end

  def call
    Thread.new{
      item.participating_users.uniq.each do |user|
        create_notification(user)
      end
    }
  end

  def create_notification(user)
    won = user == winner
    Notification.create(
      title: title(won),
      description: description(won),
      user: user,
      stock: item
    )
    SendPush.new(user.id).call
  end

  def title(won)
    won ? 'Congratulations!' : 'Better luck next time!'
  end

  def description(won)
    won ? "You won the #{item.label}!" : "Unfortunately you didn't win the #{item.label}"
  end
end