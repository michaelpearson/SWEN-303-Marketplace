class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  scope :for_user, -> (user) { where(user: user) }
end
