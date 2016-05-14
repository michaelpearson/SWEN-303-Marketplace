class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  def to_json
    {
      "id" => id,
      "user_id" => user_id,
      "stock_id" => stock_id,
      "description" => description,
      "title" => title,
      "seen" => seen,
      "title" => title,
      "pushed" => pushed,
      "icon" => stock.photos.first.image.url(:medium)
    }
  end
end
