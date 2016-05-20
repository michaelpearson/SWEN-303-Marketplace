class User < ApplicationRecord
  has_many :stocks, foreign_key: "owner_id",  class_name: "Stock"
  has_many :transactions
  has_many :notifications
  has_many :notification_settings

  def valid_password?(input_password)
    password == input_password
  end

  def transactions
    Transaction.where(user: id)
  end

  def bids
    Transaction.where(user: id, kind: "BID").map{|transaction| transaction.stock}
  end

  def uniq_bids
    Transaction.where(user: id, kind: "BID").map{|transaction| transaction.stock}.uniq
  end

  def current_stock
    stock.select(&:has_not_met_required_bids?)
  end

  def current_bids
    Transaction.where(user: id, kind: "BID").map(&:stock).uniq.select(&:has_not_met_required_bids?)
  end

  def past_bids
    Transaction.where(user: id, kind: "BID").map(&:stock).uniq.select(&:met_required_bids?)
  end

  def sold_stock
    stock.select(&:met_required_bids?)
  end

  def stock
    Stock.where(owner: id)
  end

  def has_stock?
    Stock.where(owner: id).any?
  end

  def notification_count
    notifications.unseen.count
  end

  def can_bid?
    token_count > 0
  end

  def items_won
    notifications.select(&:won?).map(&:stock)
  end
end
