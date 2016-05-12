class Stock < ApplicationRecord
  belongs_to :owner, foreign_key: "owner_id", class_name: "User"
  has_many :photos
  accepts_nested_attributes_for :photos
end
