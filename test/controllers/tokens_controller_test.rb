require 'test_helper'

class TokensControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tokens_new_url
    assert_response :success
  end

  test "should get create" do
    get tokens_create_url
    assert_response :success
  end

end
