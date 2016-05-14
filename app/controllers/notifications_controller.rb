require_relative "../services/notifications_to_json"
class NotificationsController < ApplicationController
  def pull
    id = cookies[:user_id]
    notifications = User.find_by(id: id).notifications.where(pushed: false)
    #TODO, once it works, make it set the #pushed value to true
    render json: NotificationsToJSON.new(notifications).call
  end
end
