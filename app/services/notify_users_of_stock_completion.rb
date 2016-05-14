class NotifyUsersOfStockCompletion
  attr_reader :item, :winner

  def initialize(stock, winner)
    @item = stock
    @winner = winner
  end

  def call
    item.participating_users.each do |user|
      create_notification(user)
    end
  end

  def create_notification(user)
    won = user == winner
    Notification.create(
      title: title(won),
      description: description(won),
      user: user,
      stock: item
    )
  end

  def title(won)
    won ? "Congradulations!" : "Better luck next time!"
  end

  def description(won)
    won ? "You won the #{item.label}!" : "Unfortunatley you didn't win the #{item.label}"
  end
end