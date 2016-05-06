class User < ApplicationRecord
  has_many :stocks, foreign_key: "owner_id",  class_name: "Stock"
  has_many :transactions
end
