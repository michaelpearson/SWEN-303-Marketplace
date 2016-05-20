class Stock < ApplicationRecord
  belongs_to :owner, foreign_key: "owner_id", class_name: "User"
  has_many :photos
  accepts_nested_attributes_for :photos

  DEFAULT_IMAGE_URL = "mock/hidethepain.png"

  def self.categories
    @categories ||= Stock.all.map(&:category).uniq
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

  def primary_image_url(type = :medium)
    photos.present? ? photos.first.image.url(type) : DEFAULT_IMAGE_URL
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

  def percentage_complete_from(user)
    bids_from(user) / price.to_f * 100
  end

  def self.near_completion
    Stock.all.to_a.select(&:has_not_met_required_bids?).sort_by(&:percentage_complete).reverse
  end

  alias completed? met_required_bids?
end
