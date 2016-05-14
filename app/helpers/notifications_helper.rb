module NotificationsHelper
  def seen_notifications(user)
    user.notifications.unseen.each do |x|
      x.seen = true
      x.save
    end
  end
end
