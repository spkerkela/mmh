require 'test_helper'

class MicropostsControllerTest < ActionController::TestCase
  def login_as(user)
    @request.session[:user_id] = user ? user.id : nil
  end

  test "should create a micropost" do
    login_as(users(:one))
    assert_difference('Micropost.count') do
      post :create, micropost: {content: microposts(:one).content}
    end
    assert flash
    assert_redirected_to root_url
  end
  
  test "should not create an invalid micropost" do
    login_as(users(:one))
    assert_difference('Micropost.count', +0) do
      post :create, micropost: {content: ""}
    end
    assert flash
    assert_redirected_to root_url
  end
  
  test "should delete micropost when logged in" do
    login_as(users(:one)) 
    post :create, micropost: {content: microposts(:one).content}
    assert_difference('Micropost.count', -1) do
      delete :destroy, id: users(:one).microposts[0].id
    
    end
    
    
    assert_redirected_to root_url
  end

  test "should not delete micropost if not logged in" do 
    assert_difference('Micropost.count', -0) do
      delete :destroy, id: microposts(:one).id
    end
    
    assert_redirected_to users_path
  end
  
  


end
