class User < ApplicationRecord
  has_many :stocks, foreign_key: "owner_id",  class_name: "Stock"
  has_many :transactions

  def valid_password?(input_password)
    password == input_password
  end

  def transactions
    Transaction.where(user: id)
  end

  def bids
    Transaction.where(user: id, kind: "BID")
  end

  def stock
    Stock.where(owner: id)
  end

  def has_stock?
    Stock.where(owner: id).any?
  end
end
