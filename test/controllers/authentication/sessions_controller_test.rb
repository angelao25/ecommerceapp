require "test_helper"

class Authentication::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should login an user by email" do
      post sessions_url, params: {email: ""}
    assert_redirected_to products_url
  end 
end
 