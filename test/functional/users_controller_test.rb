require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def login_as(user)
    @request.session[:user_id] = user ? user.id : nil 
  end 
  
  test "should get new" do
    get :new 
    assert :success
  end
  
  test "should create a user" do

      assert_difference "User.count" do
        post :create, user: {name: "new_name", email: "new_email@email.com", password: "12341234",
                      password_confirmation: "12341234"}
      end
      assert_equal "Account created", flash.now[:success]
      assert_response :redirect
      assert_redirected_to root_url
  end
  
  
  test "should not create a user because of non-unique name" do
      assert_difference "User.count", 0 do
        post :create, user: {name: users(:one).name, email: "testi@testi.com", password: "12341234",
                      password_confirmation: "12341234"
                     }
      end
      assert_equal "There are some issues with your form", flash.now[:alert]
      assert :new
  end
  
  test "should not create a user because of non-unique email" do
      assert_difference "User.count", 0 do
        post :create, user: {name: "some_name", email: users(:one).email, password: "12341234",
                      password_confirmation: "12341234"
                     }
      end
      assert_equal "There are some issues with your form", flash.now[:alert]
      assert :new
  end
  
  
  # test "the truth" do
  #   assert true
  # end
end
