class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  scope :unseen, -> { where(seen: false) }
  scope :for_user, -> (user) { where(user: user) }

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
      "icon" => stock.primary_image_url(:medium)
    }
  end

  def won?
    title == 'Congratulations!'
  end
end
