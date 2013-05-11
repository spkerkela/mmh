require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def setup 
    @user = User.new(
                     name: "erisnimi",
                     email: "example@ext.com",
                     password: "12341234",
                     password_confirmation: "12341234")

    @user.save
  end

  def login_as(user)
    @request.session[:user_id] = user ? user.id : nil
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should write a session when a user is logged in" do
    post :create, email: @user.email, password: @user.password
    assert_response :redirect
    assert session[:user_id].present?
    assert_equal "Logged in", flash.now[:success]
  end

  test "should delete session" do
    login_as(@user)
    delete :destroy, id: @user.id
    assert session[:user_id].nil?
    assert_response :redirect
    assert_redirected_to root_url
    assert_equal "You have logged out", flash[:notice]
  end
  # test "the truth" do
  #   assert true
  # end
end
