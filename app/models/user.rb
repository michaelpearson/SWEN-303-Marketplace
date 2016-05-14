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

  def stock
    Stock.where(owner: id)
  end

  def has_stock?
    Stock.where(owner: id).any?
  end

  def can_bid?
    token_count > 0
  end
end
