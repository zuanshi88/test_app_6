require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest
  
  test "can access signup form" do
    get '/signup' 
    assert_response :success 
  end

  test "can submit new user info" do
    assert_difference 'User.count', 1 do 
        post users_path, params: { user: { username: "bobby", email: "bobby@bob.com", password: "password"}}
    end 
  end 

   test "signup fails with incomplete user information " do
    assert_no_difference 'User.count', 1 do 
        post users_path, params: { user: { username: " ", email: "bobby@bob.com", password: "password"}}
    end 
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end 
end
