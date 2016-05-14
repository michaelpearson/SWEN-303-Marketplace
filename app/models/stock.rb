class Stock < ApplicationRecord
  belongs_to :owner, foreign_key: "owner_id", class_name: "User"
  has_many :photos
  accepts_nested_attributes_for :photos

  def bids_count
    transactions.count
  end

  def met_required_bids?
    bids_count >= price
  end

  def participating_users
    Transaction.where(stock: id).map(&:user)
  end

  def transactions
    Transaction.where(stock: id)
  end

  def has_not_met_required_bids?
    !met_required_bids?
  end
end
