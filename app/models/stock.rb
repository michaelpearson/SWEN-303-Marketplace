class Stock < ApplicationRecord
  belongs_to :owner, foreign_key: "owner_id", class_name: "User"
  has_many :photos
  accepts_nested_attributes_for :photos

  def met_required_bids?
    transactions.count >= price
  end

  def participating_users
    Transactions.where(stock: id).map(&:user)
  end

  def transactions
    Transaction.where(stock: id)
  end

  def has_not_met_required_bids?
    transactions.count < price
  end
end
