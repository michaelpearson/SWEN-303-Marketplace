require 'test_helper'

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get push" do
    get notifications_push_url
    assert_response :success
  end

end
