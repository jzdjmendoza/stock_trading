require "test_helper"

class Admins::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    get '/users/sign_in'
    sign_in users(:admin)
    post user_session_url
  end

  test "should get index" do
    get admin_users_url
    assert_response :success
  end
end
