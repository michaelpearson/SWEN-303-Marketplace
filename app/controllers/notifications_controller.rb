require_relative "../services/notifications_to_json"
class NotificationsController < ApplicationController
  def pull
    id = params[:user_id]
    notifications = User.find_by(id: id).notifications.where(pushed: false)
    render json: NotificationsToJSON.new(notifications).call
  end
end
