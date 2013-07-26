require 'test_helper'

class RelationshipsControllerTest < ActionController::TestCase
  def setup 
    @follower = FactoryGirl.create(:user)
    @followed =  FactoryGirl.create(:user)
  end

  def login_as(user)
    @request.session[:user_id] = user ? user.id : nil
  end

  test "should create a new relationship" do
    login_as(@follower)
    assert_difference('Relationship.count') do
      post :create, :relationship => {followed_id: @followed.id}
    end
    assert_redirected_to users_path(assigns(:user))
  end

  test "should delete relationship" do
    login_as(@follower) 
    @relationship = @follower.relationships.build(followed_id: @followed.id)
    
    assert_difference('Relationship.count') do
      @relationship.save
    end
   
    assert_difference('Relationship.count', -1) do
      delete :destroy, id: @relationship.id
    end
    
    
    #assert_redirected_to @follower
  end


  # test "the truth" do
  #   assert true
  # end
end
