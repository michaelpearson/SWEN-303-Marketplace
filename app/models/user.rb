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
end
