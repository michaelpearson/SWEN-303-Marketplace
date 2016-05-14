class Stock < ApplicationRecord
  belongs_to :owner, foreign_key: "owner_id", class_name: "User"
  has_many :photos
  accepts_nested_attributes_for :photos

  def categories
    Stock.all.map(&:category).uniq
  end

  def bid_count
    transactions.count
  end

  def met_required_bids?
    bid_count >= price
  end

  def bids_from(user)
    participating_users.select do |participating_user|
      participating_user == user
    end.count
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

  def met_required_bids?
    transactions.count >= price
  end

  def percentage_complete
    transactions.count / price.to_f * 100
  end
end
