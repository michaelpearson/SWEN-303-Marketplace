class NotificationsToJSON
  attr_reader :notifications
  def initialize(notifications)
    @notifications = notifications
  end

  def call
    {
      "notifications" => notifications.map(&:to_json)
    }
  end
end